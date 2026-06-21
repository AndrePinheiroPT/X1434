type token =
  | FBEGIN
  | FEND
  | HLINE
  | FIELD of (
# 8 "parser.mly"
        string * string
# 9 "parser.ml"
)
  | IMG of (
# 9 "parser.mly"
        string * string
# 14 "parser.ml"
)
  | H1
  | H2
  | H3
  | TXT of (
# 11 "parser.mly"
        string
# 22 "parser.ml"
)
  | DSTAR
  | DULINE
  | ULINE
  | STAR
  | BACKTICK
  | EXCLA
  | LBRACKET
  | RBRACKET
  | LPAREN
  | RPAREN
  | LREDA of (
# 17 "parser.mly"
        string
# 37 "parser.ml"
)
  | NL
  | DNL
  | LINK of (
# 19 "parser.mly"
        string * string
# 44 "parser.ml"
)
  | CODELINE of (
# 20 "parser.mly"
        string
# 49 "parser.ml"
)
  | CODEBLOCK of (
# 20 "parser.mly"
        string
# 54 "parser.ml"
)
  | LATEXLINE of (
# 21 "parser.mly"
        string
# 59 "parser.ml"
)
  | LATEXBLOCK of (
# 21 "parser.mly"
        string
# 64 "parser.ml"
)
  | EOF
  | END

open Parsing
let _ = parse_error;;
# 2 "parser.mly"
open Ast
open Utils
# 74 "parser.ml"
let yytransl_const = [|
  257 (* FBEGIN *);
  258 (* FEND *);
  259 (* HLINE *);
  262 (* H1 *);
  263 (* H2 *);
  264 (* H3 *);
  266 (* DSTAR *);
  267 (* DULINE *);
  268 (* ULINE *);
  269 (* STAR *);
  270 (* BACKTICK *);
  271 (* EXCLA *);
  272 (* LBRACKET *);
  273 (* RBRACKET *);
  274 (* LPAREN *);
  275 (* RPAREN *);
  277 (* NL *);
  278 (* DNL *);
    0 (* EOF *);
  284 (* END *);
    0|]

let yytransl_block = [|
  260 (* FIELD *);
  261 (* IMG *);
  265 (* TXT *);
  276 (* LREDA *);
  279 (* LINK *);
  280 (* CODELINE *);
  281 (* CODEBLOCK *);
  282 (* LATEXLINE *);
  283 (* LATEXBLOCK *);
    0|]

let yylhs = "\255\255\
\001\000\003\000\005\000\005\000\004\000\004\000\004\000\004\000\
\004\000\004\000\007\000\006\000\006\000\006\000\002\000\002\000\
\002\000\008\000\008\000\008\000\008\000\008\000\008\000\008\000\
\008\000\008\000\010\000\010\000\010\000\010\000\011\000\011\000\
\011\000\011\000\012\000\012\000\012\000\009\000\009\000\000\000"

let yylen = "\002\000\
\003\000\003\000\002\000\000\000\002\000\002\000\002\000\002\000\
\002\000\001\000\002\000\003\000\003\000\003\000\004\000\002\000\
\000\000\001\000\001\000\001\000\001\000\001\000\003\000\003\000\
\003\000\003\000\002\000\004\000\004\000\000\000\002\000\004\000\
\004\000\000\000\001\000\001\000\001\000\002\000\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\040\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\036\000\000\000\000\000\000\000\
\000\000\035\000\000\000\037\000\019\000\020\000\000\000\021\000\
\022\000\010\000\000\000\000\000\000\000\000\000\000\000\018\000\
\000\000\003\000\002\000\005\000\008\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\009\000\011\000\001\000\006\000\007\000\
\016\000\038\000\012\000\013\000\014\000\000\000\000\000\023\000\
\027\000\024\000\000\000\000\000\026\000\031\000\025\000\000\000\
\000\000\000\000\000\000\000\000\015\000\029\000\028\000\032\000\
\033\000"

let yydgoto = "\002\000\
\004\000\027\000\005\000\028\000\007\000\029\000\030\000\031\000\
\032\000\043\000\048\000\033\000"

let yysindex = "\008\000\
\020\255\000\000\032\255\000\000\071\255\032\255\035\255\071\255\
\071\255\091\255\091\255\091\255\000\000\003\255\003\255\043\255\
\043\255\000\000\091\255\000\000\000\000\000\000\071\255\000\000\
\000\000\000\000\016\255\049\000\071\255\071\255\091\255\000\000\
\002\255\000\000\000\000\000\000\000\000\041\255\049\255\053\255\
\002\255\002\255\047\255\003\255\054\255\002\255\002\255\073\255\
\043\255\074\255\069\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\077\255\080\255\000\000\
\000\000\000\000\095\255\079\255\000\000\000\000\000\000\091\255\
\003\255\003\255\043\255\043\255\000\000\000\000\000\000\000\000\
\000\000"

let yyrindex = "\000\000\
\000\000\000\000\105\255\000\000\086\255\105\255\000\000\086\255\
\086\255\086\255\086\255\086\255\000\000\099\255\102\255\098\255\
\103\255\000\000\100\255\000\000\000\000\000\000\086\255\000\000\
\000\000\000\000\000\000\000\000\086\255\086\255\048\255\000\000\
\021\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\009\255\000\000\000\000\000\000\000\000\
\014\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\048\255\
\009\255\009\255\014\255\014\255\000\000\000\000\000\000\000\000\
\000\000"

let yygindex = "\000\000\
\000\000\250\255\000\000\255\255\114\000\000\000\000\000\000\000\
\009\000\251\255\253\255\242\255"

let yytablesize = 120
let yytable = "\044\000\
\044\000\049\000\049\000\038\000\039\000\040\000\036\000\037\000\
\001\000\045\000\013\000\013\000\051\000\050\000\041\000\042\000\
\018\000\018\000\030\000\030\000\003\000\052\000\020\000\020\000\
\057\000\034\000\034\000\055\000\056\000\044\000\039\000\039\000\
\039\000\039\000\049\000\006\000\035\000\053\000\065\000\039\000\
\039\000\058\000\039\000\039\000\039\000\070\000\039\000\039\000\
\054\000\062\000\063\000\013\000\046\000\047\000\067\000\068\000\
\064\000\018\000\044\000\044\000\049\000\049\000\059\000\020\000\
\066\000\077\000\017\000\078\000\079\000\017\000\060\000\080\000\
\081\000\008\000\061\000\009\000\010\000\011\000\012\000\013\000\
\014\000\015\000\016\000\017\000\069\000\018\000\071\000\072\000\
\073\000\076\000\019\000\020\000\074\000\021\000\022\000\023\000\
\024\000\025\000\026\000\013\000\014\000\015\000\016\000\017\000\
\075\000\018\000\004\000\017\000\030\000\034\000\019\000\020\000\
\030\000\021\000\022\000\034\000\024\000\025\000\017\000\034\000"

let yycheck = "\014\000\
\015\000\016\000\017\000\010\000\011\000\012\000\008\000\009\000\
\001\000\015\000\009\001\009\001\019\000\017\000\012\001\013\001\
\015\001\015\001\010\001\011\001\001\001\023\000\021\001\021\001\
\031\000\012\001\013\001\029\000\030\000\044\000\010\001\011\001\
\012\001\013\001\049\000\004\001\002\001\022\001\044\000\019\001\
\020\001\033\000\022\001\023\001\024\001\049\000\026\001\027\001\
\000\000\041\000\042\000\009\001\010\001\011\001\046\000\047\000\
\010\001\015\001\073\000\074\000\075\000\076\000\022\001\021\001\
\011\001\072\000\019\001\073\000\074\000\022\001\022\001\075\000\
\076\000\003\001\022\001\005\001\006\001\007\001\008\001\009\001\
\010\001\011\001\012\001\013\001\012\001\015\001\013\001\019\001\
\012\001\011\001\020\001\021\001\013\001\023\001\024\001\025\001\
\026\001\027\001\028\001\009\001\010\001\011\001\012\001\013\001\
\010\001\015\001\002\001\022\001\010\001\012\001\020\001\021\001\
\011\001\023\001\024\001\013\001\026\001\027\001\019\001\006\000"

let yynames_const = "\
  FBEGIN\000\
  FEND\000\
  HLINE\000\
  H1\000\
  H2\000\
  H3\000\
  DSTAR\000\
  DULINE\000\
  ULINE\000\
  STAR\000\
  BACKTICK\000\
  EXCLA\000\
  LBRACKET\000\
  RBRACKET\000\
  LPAREN\000\
  RPAREN\000\
  NL\000\
  DNL\000\
  EOF\000\
  END\000\
  "

let yynames_block = "\
  FIELD\000\
  IMG\000\
  TXT\000\
  LREDA\000\
  LINK\000\
  CODELINE\000\
  CODEBLOCK\000\
  LATEXLINE\000\
  LATEXBLOCK\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'head) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'body) in
    Obj.repr(
# 33 "parser.mly"
        ( (_1,_2) )
# 249 "parser.ml"
               : string Utils.StringMap.t * Ast.node list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'fields) in
    Obj.repr(
# 37 "parser.mly"
        ( _2 )
# 256 "parser.ml"
               : 'head))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string * string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fields) in
    Obj.repr(
# 41 "parser.mly"
        ( 
            let (k,v) = _1 in 
            StringMap.add k v _2
        )
# 267 "parser.ml"
               : 'fields))
; (fun __caml_parser_env ->
    Obj.repr(
# 46 "parser.mly"
        ( StringMap.empty )
# 273 "parser.ml"
               : 'fields))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'body) in
    Obj.repr(
# 50 "parser.mly"
        ( (In HorLine) :: _2 )
# 280 "parser.ml"
               : 'body))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'header) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'body) in
    Obj.repr(
# 52 "parser.mly"
        ( _1 :: _2 )
# 288 "parser.ml"
               : 'body))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'paragraph) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'body) in
    Obj.repr(
# 54 "parser.mly"
        ( _1 :: _2 )
# 296 "parser.ml"
               : 'body))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string * string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'body) in
    Obj.repr(
# 56 "parser.mly"
        ( let (alt, src) = _1 in (In (Img(alt, src))) :: _2 )
# 304 "parser.ml"
               : 'body))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'body) in
    Obj.repr(
# 58 "parser.mly"
        ( (In (CodeBlock(_1))) :: _2 )
# 312 "parser.ml"
               : 'body))
; (fun __caml_parser_env ->
    Obj.repr(
# 60 "parser.mly"
        ( [] )
# 318 "parser.ml"
               : 'body))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Ast.node list) in
    Obj.repr(
# 64 "parser.mly"
        ( In (Paragraph(_1)) )
# 325 "parser.ml"
               : 'paragraph))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Ast.node list) in
    Obj.repr(
# 68 "parser.mly"
        ( In (Head(1, _2)) )
# 332 "parser.ml"
               : 'header))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Ast.node list) in
    Obj.repr(
# 70 "parser.mly"
        ( In (Head(2, _2)) )
# 339 "parser.ml"
               : 'header))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Ast.node list) in
    Obj.repr(
# 72 "parser.mly"
        ( In (Head(3, _2)) )
# 346 "parser.ml"
               : 'header))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 2 : Ast.node list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : Ast.node list) in
    Obj.repr(
# 76 "parser.mly"
        ( 
            let id_list = _1 |> String.split_on_char ',' |> List.map String.trim in
            [In (Redact (id_list,_2))] @ _4 
        )
# 358 "parser.ml"
               : Ast.node list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'inline_element) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Ast.node list) in
    Obj.repr(
# 81 "parser.mly"
        ( _1 @ _2 )
# 366 "parser.ml"
               : Ast.node list))
; (fun __caml_parser_env ->
    Obj.repr(
# 83 "parser.mly"
        ( [] )
# 372 "parser.ml"
               : Ast.node list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'atomic_text_list) in
    Obj.repr(
# 87 "parser.mly"
        ( _1 )
# 379 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string * string) in
    Obj.repr(
# 89 "parser.mly"
        ( let (lbl, url) = _1 in [In (Link(lbl, url))] )
# 386 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 91 "parser.mly"
        ( [In (CodeLine(_1))] )
# 393 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 93 "parser.mly"
        ( [In (LatexLine(_1))] )
# 400 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 95 "parser.mly"
        ( [In (LatexBlock(_1))] )
# 407 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'italic_inline) in
    Obj.repr(
# 97 "parser.mly"
        ( [In (Bold(_2))] )
# 414 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'italic_inline) in
    Obj.repr(
# 99 "parser.mly"
        ( [In (Bold(_2))] )
# 421 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'bold_inline) in
    Obj.repr(
# 101 "parser.mly"
        ( [In (Italic(_2))] )
# 428 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'bold_inline) in
    Obj.repr(
# 103 "parser.mly"
        ( [In (Italic(_2))] )
# 435 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'atomic_text) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'italic_inline) in
    Obj.repr(
# 107 "parser.mly"
        ( _1 :: _2 )
# 443 "parser.ml"
               : 'italic_inline))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'atomic_text_list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'italic_inline) in
    Obj.repr(
# 109 "parser.mly"
        ( (In (Italic(_2))) :: _4 )
# 451 "parser.ml"
               : 'italic_inline))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'atomic_text_list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'italic_inline) in
    Obj.repr(
# 111 "parser.mly"
        ( (In (Italic(_2))) :: _4 )
# 459 "parser.ml"
               : 'italic_inline))
; (fun __caml_parser_env ->
    Obj.repr(
# 113 "parser.mly"
        ( [] )
# 465 "parser.ml"
               : 'italic_inline))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'atomic_text) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'bold_inline) in
    Obj.repr(
# 117 "parser.mly"
        ( _1 :: _2 )
# 473 "parser.ml"
               : 'bold_inline))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'atomic_text_list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'bold_inline) in
    Obj.repr(
# 119 "parser.mly"
        ( (In (Bold(_2))) :: _4 )
# 481 "parser.ml"
               : 'bold_inline))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'atomic_text_list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'bold_inline) in
    Obj.repr(
# 121 "parser.mly"
        ( (In (Bold(_2))) :: _4 )
# 489 "parser.ml"
               : 'bold_inline))
; (fun __caml_parser_env ->
    Obj.repr(
# 123 "parser.mly"
        ( [] )
# 495 "parser.ml"
               : 'bold_inline))
; (fun __caml_parser_env ->
    Obj.repr(
# 127 "parser.mly"
        ( In (Text("!")) )
# 501 "parser.ml"
               : 'atomic_text))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 129 "parser.mly"
        ( In (Text(_1)) )
# 508 "parser.ml"
               : 'atomic_text))
; (fun __caml_parser_env ->
    Obj.repr(
# 131 "parser.mly"
        ( In Break )
# 514 "parser.ml"
               : 'atomic_text))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'atomic_text) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'atomic_text_list) in
    Obj.repr(
# 135 "parser.mly"
        ( _1 :: _2 )
# 522 "parser.ml"
               : 'atomic_text_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'atomic_text) in
    Obj.repr(
# 137 "parser.mly"
        ( [_1] )
# 529 "parser.ml"
               : 'atomic_text_list))
(* Entry main *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let main (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : string Utils.StringMap.t * Ast.node list)
