type token =
  | FBEGIN
  | FMID
  | FEND
  | HLINE
  | FIELD of (
# 8 "parser.mly"
        string * string
# 10 "parser.ml"
)
  | IMG of (
# 9 "parser.mly"
        string * string
# 15 "parser.ml"
)
  | H1
  | H2
  | H3
  | TXT of (
# 11 "parser.mly"
        string
# 23 "parser.ml"
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
# 38 "parser.ml"
)
  | NAV of (
# 18 "parser.mly"
        string * string * string
# 43 "parser.ml"
)
  | NL
  | DNL
  | LINK of (
# 20 "parser.mly"
        string * string
# 50 "parser.ml"
)
  | CODELINE of (
# 21 "parser.mly"
        string
# 55 "parser.ml"
)
  | CODEBLOCK of (
# 21 "parser.mly"
        string
# 60 "parser.ml"
)
  | LATEXLINE of (
# 22 "parser.mly"
        string
# 65 "parser.ml"
)
  | LATEXBLOCK of (
# 22 "parser.mly"
        string
# 70 "parser.ml"
)
  | EOF
  | END

open Parsing
let _ = parse_error;;
# 2 "parser.mly"
open Ast
open Utils
# 80 "parser.ml"
let yytransl_const = [|
  257 (* FBEGIN *);
  258 (* FMID *);
  259 (* FEND *);
  260 (* HLINE *);
  263 (* H1 *);
  264 (* H2 *);
  265 (* H3 *);
  267 (* DSTAR *);
  268 (* DULINE *);
  269 (* ULINE *);
  270 (* STAR *);
  271 (* BACKTICK *);
  272 (* EXCLA *);
  273 (* LBRACKET *);
  274 (* RBRACKET *);
  275 (* LPAREN *);
  276 (* RPAREN *);
  279 (* NL *);
  280 (* DNL *);
    0 (* EOF *);
  286 (* END *);
    0|]

let yytransl_block = [|
  261 (* FIELD *);
  262 (* IMG *);
  266 (* TXT *);
  277 (* LREDA *);
  278 (* NAV *);
  281 (* LINK *);
  282 (* CODELINE *);
  283 (* CODEBLOCK *);
  284 (* LATEXLINE *);
  285 (* LATEXBLOCK *);
    0|]

let yylhs = "\255\255\
\001\000\003\000\004\000\004\000\006\000\006\000\005\000\005\000\
\005\000\005\000\005\000\008\000\007\000\007\000\007\000\002\000\
\002\000\002\000\002\000\009\000\009\000\009\000\009\000\009\000\
\009\000\009\000\009\000\009\000\011\000\011\000\011\000\011\000\
\012\000\012\000\012\000\012\000\013\000\013\000\013\000\010\000\
\010\000\000\000"

let yylen = "\002\000\
\004\000\003\000\002\000\001\000\002\000\000\000\002\000\002\000\
\002\000\002\000\001\000\002\000\003\000\003\000\003\000\004\000\
\002\000\002\000\000\000\001\000\001\000\001\000\001\000\001\000\
\003\000\003\000\003\000\003\000\002\000\004\000\004\000\000\000\
\002\000\004\000\004\000\000\000\001\000\001\000\001\000\002\000\
\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\042\000\000\000\000\000\000\000\004\000\
\000\000\000\000\005\000\002\000\003\000\000\000\000\000\000\000\
\000\000\000\000\038\000\000\000\000\000\000\000\000\000\037\000\
\000\000\039\000\021\000\022\000\000\000\023\000\024\000\011\000\
\000\000\000\000\000\000\000\000\000\000\020\000\000\000\007\000\
\018\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\010\000\
\012\000\001\000\008\000\009\000\017\000\040\000\013\000\014\000\
\015\000\000\000\000\000\025\000\029\000\026\000\000\000\000\000\
\028\000\033\000\027\000\000\000\000\000\000\000\000\000\000\000\
\016\000\031\000\030\000\034\000\035\000"

let yydgoto = "\002\000\
\004\000\033\000\005\000\010\000\034\000\007\000\035\000\036\000\
\037\000\038\000\047\000\052\000\039\000"

let yysindex = "\003\000\
\014\255\000\000\024\255\000\000\002\255\024\255\029\255\000\000\
\002\255\068\255\000\000\000\000\000\000\068\255\007\255\007\255\
\007\255\007\255\000\000\035\255\035\255\100\255\100\255\000\000\
\007\255\000\000\000\000\000\000\068\255\000\000\000\000\000\000\
\030\255\052\000\068\255\068\255\007\255\000\000\027\255\000\000\
\000\000\031\255\032\255\033\255\027\255\027\255\042\255\035\255\
\047\255\027\255\027\255\049\255\100\255\046\255\053\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\056\255\069\255\000\000\000\000\000\000\074\255\075\255\
\000\000\000\000\000\000\007\255\035\255\035\255\100\255\100\255\
\000\000\000\000\000\000\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\084\255\000\000\000\000\084\255\000\000\000\000\
\000\000\064\255\000\000\000\000\000\000\064\255\248\254\064\255\
\064\255\064\255\000\000\079\255\080\255\087\255\088\255\000\000\
\081\255\000\000\000\000\000\000\064\255\000\000\000\000\000\000\
\000\000\000\000\064\255\064\255\248\254\000\000\093\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\015\255\
\000\000\000\000\000\000\000\000\028\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\248\254\015\255\015\255\028\255\028\255\
\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\241\255\000\000\094\000\011\000\102\000\000\000\000\000\
\000\000\081\000\246\255\247\255\242\255"

let yytablesize = 132
let yytable = "\041\000\
\042\000\043\000\044\000\001\000\008\000\048\000\048\000\053\000\
\053\000\055\000\049\000\019\000\015\000\054\000\003\000\019\000\
\019\000\020\000\021\000\022\000\023\000\061\000\024\000\009\000\
\040\000\032\000\032\000\025\000\006\000\026\000\012\000\027\000\
\028\000\048\000\030\000\031\000\019\000\069\000\053\000\056\000\
\036\000\036\000\024\000\074\000\019\000\059\000\060\000\045\000\
\046\000\026\000\024\000\058\000\068\000\057\000\063\000\064\000\
\065\000\026\000\070\000\075\000\081\000\073\000\048\000\048\000\
\053\000\053\000\082\000\083\000\077\000\084\000\085\000\014\000\
\076\000\015\000\016\000\017\000\018\000\019\000\020\000\021\000\
\022\000\023\000\078\000\024\000\079\000\006\000\080\000\019\000\
\025\000\032\000\026\000\032\000\027\000\028\000\029\000\030\000\
\031\000\032\000\041\000\036\000\019\000\036\000\013\000\041\000\
\041\000\041\000\041\000\011\000\000\000\019\000\050\000\051\000\
\041\000\041\000\000\000\024\000\041\000\041\000\041\000\062\000\
\041\000\041\000\026\000\000\000\000\000\066\000\067\000\000\000\
\000\000\000\000\071\000\072\000"

let yycheck = "\015\000\
\016\000\017\000\018\000\001\000\003\001\020\000\021\000\022\000\
\023\000\025\000\021\000\020\001\006\001\023\000\001\001\024\001\
\010\001\011\001\012\001\013\001\014\001\037\000\016\001\022\001\
\014\000\011\001\012\001\021\001\005\001\023\001\002\001\025\001\
\026\001\048\000\028\001\029\001\010\001\048\000\053\000\029\000\
\013\001\014\001\016\001\053\000\010\001\035\000\036\000\013\001\
\014\001\023\001\016\001\000\000\011\001\024\001\024\001\024\001\
\024\001\023\001\012\001\014\001\076\000\013\001\077\000\078\000\
\079\000\080\000\077\000\078\000\013\001\079\000\080\000\004\001\
\020\001\006\001\007\001\008\001\009\001\010\001\011\001\012\001\
\013\001\014\001\014\001\016\001\011\001\002\001\012\001\024\001\
\021\001\011\001\023\001\012\001\025\001\026\001\027\001\028\001\
\029\001\030\001\006\001\013\001\020\001\014\001\009\000\011\001\
\012\001\013\001\014\001\006\000\255\255\010\001\011\001\012\001\
\020\001\021\001\255\255\016\001\024\001\025\001\026\001\039\000\
\028\001\029\001\023\001\255\255\255\255\045\000\046\000\255\255\
\255\255\255\255\050\000\051\000"

let yynames_const = "\
  FBEGIN\000\
  FMID\000\
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
  NAV\000\
  LINK\000\
  CODELINE\000\
  CODEBLOCK\000\
  LATEXLINE\000\
  LATEXBLOCK\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'head) in
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'nav) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'body) in
    Obj.repr(
# 34 "parser.mly"
        ( (_1,_2,_3) )
# 266 "parser.ml"
               : string Utils.StringMap.t * (string list * string * string ) list * Ast.node list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'fields) in
    Obj.repr(
# 38 "parser.mly"
        ( _2 )
# 273 "parser.ml"
               : 'head))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string * string * string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'nav) in
    Obj.repr(
# 42 "parser.mly"
        ( 
            let (b,alt,url) = _1 in
            let id_list = b |> String.split_on_char ',' |> List.map String.trim in
            (id_list,alt,url) :: _2
        )
# 285 "parser.ml"
               : 'nav))
; (fun __caml_parser_env ->
    Obj.repr(
# 48 "parser.mly"
        ( [] )
# 291 "parser.ml"
               : 'nav))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string * string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fields) in
    Obj.repr(
# 53 "parser.mly"
        ( 
            let (k,v) = _1 in 
            StringMap.add k v _2
        )
# 302 "parser.ml"
               : 'fields))
; (fun __caml_parser_env ->
    Obj.repr(
# 58 "parser.mly"
        ( StringMap.empty )
# 308 "parser.ml"
               : 'fields))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'body) in
    Obj.repr(
# 62 "parser.mly"
        ( (In HorLine) :: _2 )
# 315 "parser.ml"
               : 'body))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'header) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'body) in
    Obj.repr(
# 64 "parser.mly"
        ( _1 :: _2 )
# 323 "parser.ml"
               : 'body))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'paragraph) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'body) in
    Obj.repr(
# 66 "parser.mly"
        ( _1 :: _2 )
# 331 "parser.ml"
               : 'body))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'body) in
    Obj.repr(
# 68 "parser.mly"
        ( (In (CodeBlock(_1))) :: _2 )
# 339 "parser.ml"
               : 'body))
; (fun __caml_parser_env ->
    Obj.repr(
# 70 "parser.mly"
        ( [] )
# 345 "parser.ml"
               : 'body))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Ast.node list) in
    Obj.repr(
# 74 "parser.mly"
        ( In (Paragraph(_1)) )
# 352 "parser.ml"
               : 'paragraph))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Ast.node list) in
    Obj.repr(
# 78 "parser.mly"
        ( In (Head(1, _2)) )
# 359 "parser.ml"
               : 'header))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Ast.node list) in
    Obj.repr(
# 80 "parser.mly"
        ( In (Head(2, _2)) )
# 366 "parser.ml"
               : 'header))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Ast.node list) in
    Obj.repr(
# 82 "parser.mly"
        ( In (Head(3, _2)) )
# 373 "parser.ml"
               : 'header))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 2 : Ast.node list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : Ast.node list) in
    Obj.repr(
# 86 "parser.mly"
        ( 
            let id_list = _1 |> String.split_on_char ',' |> List.map String.trim in
            [In (Redact (id_list,_2))] @ _4 
        )
# 385 "parser.ml"
               : Ast.node list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'inline_element) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Ast.node list) in
    Obj.repr(
# 91 "parser.mly"
        ( _1 @ _2 )
# 393 "parser.ml"
               : Ast.node list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string * string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Ast.node list) in
    Obj.repr(
# 93 "parser.mly"
        ( let (alt, src) = _1 in (In (Img(alt, src))) :: _2 )
# 401 "parser.ml"
               : Ast.node list))
; (fun __caml_parser_env ->
    Obj.repr(
# 95 "parser.mly"
        ( [] )
# 407 "parser.ml"
               : Ast.node list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'atomic_text_list) in
    Obj.repr(
# 99 "parser.mly"
        ( _1 )
# 414 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string * string) in
    Obj.repr(
# 101 "parser.mly"
        ( let (lbl, url) = _1 in [In (Link(lbl, url))] )
# 421 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 103 "parser.mly"
        ( [In (CodeLine(_1))] )
# 428 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 105 "parser.mly"
        ( [In (LatexLine(_1))] )
# 435 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 107 "parser.mly"
        ( [In (LatexBlock(_1))] )
# 442 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'italic_inline) in
    Obj.repr(
# 109 "parser.mly"
        ( [In (Bold(_2))] )
# 449 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'italic_inline) in
    Obj.repr(
# 111 "parser.mly"
        ( [In (Bold(_2))] )
# 456 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'bold_inline) in
    Obj.repr(
# 113 "parser.mly"
        ( [In (Italic(_2))] )
# 463 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'bold_inline) in
    Obj.repr(
# 115 "parser.mly"
        ( [In (Italic(_2))] )
# 470 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'atomic_text) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'italic_inline) in
    Obj.repr(
# 119 "parser.mly"
        ( _1 :: _2 )
# 478 "parser.ml"
               : 'italic_inline))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'atomic_text_list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'italic_inline) in
    Obj.repr(
# 121 "parser.mly"
        ( (In (Italic(_2))) :: _4 )
# 486 "parser.ml"
               : 'italic_inline))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'atomic_text_list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'italic_inline) in
    Obj.repr(
# 123 "parser.mly"
        ( (In (Italic(_2))) :: _4 )
# 494 "parser.ml"
               : 'italic_inline))
; (fun __caml_parser_env ->
    Obj.repr(
# 125 "parser.mly"
        ( [] )
# 500 "parser.ml"
               : 'italic_inline))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'atomic_text) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'bold_inline) in
    Obj.repr(
# 129 "parser.mly"
        ( _1 :: _2 )
# 508 "parser.ml"
               : 'bold_inline))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'atomic_text_list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'bold_inline) in
    Obj.repr(
# 131 "parser.mly"
        ( (In (Bold(_2))) :: _4 )
# 516 "parser.ml"
               : 'bold_inline))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'atomic_text_list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'bold_inline) in
    Obj.repr(
# 133 "parser.mly"
        ( (In (Bold(_2))) :: _4 )
# 524 "parser.ml"
               : 'bold_inline))
; (fun __caml_parser_env ->
    Obj.repr(
# 135 "parser.mly"
        ( [] )
# 530 "parser.ml"
               : 'bold_inline))
; (fun __caml_parser_env ->
    Obj.repr(
# 139 "parser.mly"
        ( In (Text("!")) )
# 536 "parser.ml"
               : 'atomic_text))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 141 "parser.mly"
        ( In (Text(_1)) )
# 543 "parser.ml"
               : 'atomic_text))
; (fun __caml_parser_env ->
    Obj.repr(
# 143 "parser.mly"
        ( In Break )
# 549 "parser.ml"
               : 'atomic_text))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'atomic_text) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'atomic_text_list) in
    Obj.repr(
# 147 "parser.mly"
        ( _1 :: _2 )
# 557 "parser.ml"
               : 'atomic_text_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'atomic_text) in
    Obj.repr(
# 149 "parser.mly"
        ( [_1] )
# 564 "parser.ml"
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
   (Parsing.yyparse yytables 1 lexfun lexbuf : string Utils.StringMap.t * (string list * string * string ) list * Ast.node list)
