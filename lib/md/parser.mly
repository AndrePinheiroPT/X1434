%{
open Ast
open Utils
%}

%token FBEGIN FMID FEND
%token HLINE
%token <string * string> FIELD 
%token <string * string> IMG
%token H1 H2 H3
%token <string> TXT
%token DSTAR
%token DULINE ULINE
%token STAR BACKTICK EXCLA
%token LBRACKET RBRACKET 
%token LPAREN RPAREN 
%token <string> LREDA
%token <string * string * string> NAV
%token NL DNL
%token <string * string> LINK
%token <string> CODELINE CODEBLOCK
%token <string> LATEXLINE LATEXBLOCK
%token EOF END


%start main
%type <string Utils.StringMap.t * (string list * string * string ) list * Ast.node list> main
%type <Ast.node list> inline_list

%% 

main: 
    | head nav body EOF
        { ($1,$2,$3) }

head:
    | FBEGIN fields FMID
        { $2 }

nav:
    | NAV nav
        { 
            let (b,alt,url) = $1 in
            let id_list = b |> String.split_on_char ',' |> List.map String.trim in
            (id_list,alt,url) :: $2
        }
    | FEND
        { [] }


fields:
    | FIELD fields
        { 
            let (k,v) = $1 in 
            StringMap.add k v $2
        }
    | 
        { StringMap.empty }

body: 
    | HLINE body
        { (In HorLine) :: $2 }
    | header body
        { $1 :: $2 }
    | paragraph body
        { $1 :: $2 }
    | CODEBLOCK body
        { (In (CodeBlock($1))) :: $2 }
    | END
        { [] }

paragraph:
    | inline_list DNL 
        { In (Paragraph($1)) }

header: 
    | H1 inline_list DNL
        { In (Head(1, $2)) }
    | H2 inline_list  DNL
        { In (Head(2, $2)) }
    | H3 inline_list DNL
        { In (Head(3, $2)) }

inline_list:
    | LREDA inline_list RPAREN inline_list 
        { 
            let id_list = $1 |> String.split_on_char ',' |> List.map String.trim in
            [In (Redact (id_list,$2))] @ $4 
        }
    | inline_element inline_list
        { $1 @ $2 }
    | IMG inline_list
        { let (alt, src) = $1 in (In (Img(alt, src))) :: $2 }
    | 
        { [] }

inline_element:
    | atomic_text_list
        { $1 }
    | LINK
        { let (lbl, url) = $1 in [In (Link(lbl, url))] }
    | CODELINE 
        { [In (CodeLine($1))] }
    | LATEXLINE 
        { [In (LatexLine($1))] }
    | LATEXBLOCK
        { [In (LatexBlock($1))] }
    | DSTAR italic_inline DSTAR 
        { [In (Bold($2))] }
    | DULINE italic_inline DULINE
        { [In (Bold($2))] }
    | STAR bold_inline STAR   
        { [In (Italic($2))] }
    | ULINE bold_inline ULINE   
        { [In (Italic($2))] }

italic_inline: 
    | atomic_text italic_inline
        { $1 :: $2 }
    | STAR atomic_text_list STAR italic_inline
        { (In (Italic($2))) :: $4 }
    | ULINE atomic_text_list ULINE italic_inline
        { (In (Italic($2))) :: $4 }
    | 
        { [] }

bold_inline: 
    | atomic_text bold_inline
        { $1 :: $2 }
    | DSTAR atomic_text_list DSTAR bold_inline
        { (In (Bold($2))) :: $4 }
    | DULINE atomic_text_list DULINE bold_inline
        { (In (Bold($2))) :: $4 }
    |
        { [] }

atomic_text:
    | EXCLA               
        { In (Text("!")) }
    | TXT               
        { In (Text($1)) }
    | NL                
        { In Break }

atomic_text_list:
    | atomic_text atomic_text_list
        { $1 :: $2 }
    | atomic_text
        { [$1] }

