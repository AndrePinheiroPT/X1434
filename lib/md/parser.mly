%{
open Ast
%}

%token FBEGIN FEND
%token HLINE
%token <string * string> FIELD 
%token H1 H2 H3
%token <string> TXT
%token DSTAR
%token STAR BACKTICK
%token LBRACKET RBRACKET 
%token LPAREN RPAREN 
%token NL DNL
%token EOF END


%start main
%type <Ast.doc> main 
%type <Ast.inline list> inline_list
%type <Ast.block list> body

%% 

main: 
    | head body EOF
        { Ast.Doc($1,$2) }

head:
    | FBEGIN fields FEND
        { $2 }

fields:
    | FIELD fields
        { let (k,v) = $1 in Ast.Field(k,v) :: $2 }
    | 
        { [] }

body: 
    | HLINE body
        { Ast.HorLine :: $2 }
    | header body
        { $1 :: $2 }
    | paragraph body
        { $1 :: $2 }
    | END
        { [] }

paragraph:
    | inline_list DNL 
        { Ast.Paragraph($1) }

header: 
    | H1 TXT DNL
        { Ast.Head(1, $2) }
    | H2 TXT DNL
        { Ast.Head(2, $2) }
    | H3 TXT DNL
        { Ast.Head(3, $2) }

inline_list:
    | inline_element inline_list
        { $1 @ $2 }
    | 
        { [] }

inline_element:
    | atomic_text_list
        { $1 }
    | DSTAR italic_inline DSTAR 
        { [Ast.Bold($2)] }
    | STAR bold_inline STAR   
        { [Ast.Italic($2)] }

italic_inline: 
    | atomic_text italic_inline
        { $1 :: $2 }
    | STAR atomic_text_list STAR italic_inline
        { Ast.Italic($2) :: $4 }
    | 
        { [] }

bold_inline: 
    | atomic_text bold_inline
        { $1 :: $2 }
    | DSTAR atomic_text_list DSTAR bold_inline
        { Ast.Bold($2) :: $4 }
    |
        { [] }

atomic_text:
    | TXT               
        { Ast.Text($1) }
    | NL                
        { Ast.Break }

atomic_text_list:
    | atomic_text atomic_text_list
        { $1 :: $2 }
    | atomic_text
        { [$1] }

