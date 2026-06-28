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
  | BULLET
  | EOF
  | END

open Parsing
let _ = parse_error;;
# 2 "parser.mly"
open Ast
open Utils
# 81 "parser.ml"
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
  286 (* BULLET *);
    0 (* EOF *);
  287 (* END *);
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
\005\000\005\000\005\000\005\000\009\000\010\000\010\000\008\000\
\007\000\007\000\007\000\002\000\002\000\002\000\002\000\011\000\
\011\000\011\000\011\000\011\000\011\000\011\000\013\000\013\000\
\013\000\013\000\014\000\014\000\014\000\014\000\015\000\015\000\
\015\000\015\000\012\000\012\000\000\000"

let yylen = "\002\000\
\004\000\003\000\002\000\001\000\002\000\000\000\002\000\002\000\
\002\000\002\000\002\000\001\000\001\000\003\000\004\000\002\000\
\003\000\003\000\003\000\004\000\002\000\002\000\000\000\001\000\
\001\000\001\000\003\000\003\000\003\000\003\000\002\000\004\000\
\004\000\000\000\002\000\004\000\004\000\000\000\001\000\001\000\
\001\000\001\000\002\000\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\045\000\000\000\000\000\000\000\004\000\
\000\000\000\000\005\000\002\000\003\000\000\000\000\000\000\000\
\000\000\000\000\042\000\000\000\000\000\000\000\000\000\039\000\
\000\000\025\000\041\000\000\000\040\000\026\000\000\000\012\000\
\000\000\000\000\000\000\000\000\000\000\013\000\000\000\024\000\
\000\000\007\000\022\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\011\000\000\000\016\000\001\000\008\000\009\000\010\000\
\021\000\043\000\017\000\018\000\019\000\000\000\000\000\027\000\
\031\000\028\000\000\000\000\000\030\000\035\000\029\000\000\000\
\000\000\014\000\000\000\000\000\000\000\000\000\020\000\015\000\
\033\000\032\000\036\000\037\000"

let yydgoto = "\002\000\
\004\000\033\000\005\000\010\000\034\000\007\000\035\000\036\000\
\037\000\038\000\039\000\040\000\049\000\054\000\041\000"

let yysindex = "\008\000\
\011\255\000\000\028\255\000\000\010\255\028\255\016\255\000\000\
\010\255\071\255\000\000\000\000\000\000\071\255\013\255\013\255\
\013\255\013\255\000\000\034\255\034\255\078\255\078\255\000\000\
\013\255\000\000\000\000\071\255\000\000\000\000\013\255\000\000\
\247\254\036\000\071\255\071\255\071\255\000\000\013\255\000\000\
\030\255\000\000\000\000\025\255\027\255\031\255\030\255\030\255\
\046\255\034\255\047\255\030\255\030\255\048\255\078\255\058\255\
\056\255\000\000\044\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\073\255\077\255\000\000\
\000\000\000\000\082\255\083\255\000\000\000\000\000\000\013\255\
\075\255\000\000\034\255\034\255\078\255\078\255\000\000\000\000\
\000\000\000\000\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\105\255\000\000\000\000\105\255\000\000\000\000\
\000\000\095\255\000\000\000\000\000\000\095\255\092\255\095\255\
\095\255\095\255\000\000\118\255\113\255\117\255\119\255\000\000\
\111\255\000\000\000\000\095\255\000\000\000\000\090\255\000\000\
\000\000\000\000\095\255\095\255\095\255\000\000\092\255\000\000\
\097\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\112\255\000\000\000\000\000\000\000\000\114\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\092\255\
\000\000\000\000\112\255\112\255\114\255\114\255\000\000\000\000\
\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\245\255\000\000\123\000\017\000\128\000\000\000\000\000\
\000\000\054\000\000\000\225\255\243\255\244\255\236\255"

let yytablesize = 135
let yytable = "\050\000\
\050\000\055\000\055\000\043\000\044\000\045\000\046\000\051\000\
\001\000\066\000\056\000\003\000\008\000\057\000\060\000\070\000\
\071\000\012\000\015\000\059\000\075\000\076\000\019\000\020\000\
\021\000\022\000\023\000\065\000\024\000\050\000\042\000\009\000\
\006\000\025\000\055\000\061\000\073\000\026\000\027\000\019\000\
\029\000\030\000\078\000\019\000\058\000\024\000\047\000\048\000\
\067\000\024\000\068\000\062\000\063\000\064\000\069\000\027\000\
\072\000\029\000\074\000\027\000\077\000\029\000\050\000\050\000\
\055\000\055\000\081\000\082\000\087\000\089\000\090\000\079\000\
\091\000\092\000\014\000\080\000\015\000\016\000\017\000\018\000\
\019\000\020\000\021\000\022\000\023\000\083\000\024\000\019\000\
\052\000\053\000\084\000\025\000\085\000\024\000\086\000\026\000\
\027\000\028\000\029\000\030\000\031\000\032\000\044\000\027\000\
\031\000\029\000\006\000\044\000\044\000\044\000\044\000\023\000\
\023\000\023\000\023\000\023\000\044\000\044\000\023\000\044\000\
\044\000\044\000\034\000\034\000\034\000\044\000\038\000\038\000\
\034\000\038\000\023\000\013\000\038\000\011\000\088\000"

let yycheck = "\020\000\
\021\000\022\000\023\000\015\000\016\000\017\000\018\000\021\000\
\001\000\041\000\023\000\001\001\003\001\025\000\024\001\047\000\
\048\000\002\001\006\001\031\000\052\000\053\000\010\001\011\001\
\012\001\013\001\014\001\039\000\016\001\050\000\014\000\022\001\
\005\001\021\001\055\000\000\000\050\000\025\001\026\001\010\001\
\028\001\029\001\055\000\010\001\028\000\016\001\013\001\014\001\
\024\001\016\001\024\001\035\000\036\000\037\000\024\001\026\001\
\011\001\028\001\012\001\026\001\013\001\028\001\083\000\084\000\
\085\000\086\000\023\001\024\001\080\000\083\000\084\000\014\001\
\085\000\086\000\004\001\020\001\006\001\007\001\008\001\009\001\
\010\001\011\001\012\001\013\001\014\001\013\001\016\001\010\001\
\011\001\012\001\014\001\021\001\011\001\016\001\012\001\025\001\
\026\001\027\001\028\001\029\001\030\001\031\001\006\001\026\001\
\030\001\028\001\002\001\011\001\012\001\013\001\014\001\020\001\
\023\001\024\001\023\001\024\001\020\001\021\001\024\001\023\001\
\024\001\025\001\011\001\012\001\012\001\029\001\013\001\014\001\
\011\001\013\001\020\001\009\000\014\001\006\000\081\000"

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
  BULLET\000\
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
# 35 "parser.mly"
        ( (_1,_2,_3) )
# 272 "parser.ml"
               : string Utils.StringMap.t * (string list * string * string ) list * Ast.node list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'fields) in
    Obj.repr(
# 39 "parser.mly"
        ( _2 )
# 279 "parser.ml"
               : 'head))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string * string * string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'nav) in
    Obj.repr(
# 43 "parser.mly"
        ( 
            let (b,alt,url) = _1 in
            let id_list = b |> String.split_on_char ',' |> List.map String.trim in
            (id_list,alt,url) :: _2
        )
# 291 "parser.ml"
               : 'nav))
; (fun __caml_parser_env ->
    Obj.repr(
# 49 "parser.mly"
        ( [] )
# 297 "parser.ml"
               : 'nav))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string * string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fields) in
    Obj.repr(
# 54 "parser.mly"
        ( 
            let (k,v) = _1 in 
            StringMap.add k v _2
        )
# 308 "parser.ml"
               : 'fields))
; (fun __caml_parser_env ->
    Obj.repr(
# 59 "parser.mly"
        ( StringMap.empty )
# 314 "parser.ml"
               : 'fields))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'body) in
    Obj.repr(
# 63 "parser.mly"
        ( (In HorLine) :: _2 )
# 321 "parser.ml"
               : 'body))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'header) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'body) in
    Obj.repr(
# 65 "parser.mly"
        ( _1 :: _2 )
# 329 "parser.ml"
               : 'body))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'paragraph) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'body) in
    Obj.repr(
# 67 "parser.mly"
        ( _1 :: _2 )
# 337 "parser.ml"
               : 'body))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'list_block) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'body) in
    Obj.repr(
# 69 "parser.mly"
        ( _1 :: _2 )
# 345 "parser.ml"
               : 'body))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'body) in
    Obj.repr(
# 71 "parser.mly"
        ( (In (CodeBlock(_1))) :: _2 )
# 353 "parser.ml"
               : 'body))
; (fun __caml_parser_env ->
    Obj.repr(
# 73 "parser.mly"
        ( [] )
# 359 "parser.ml"
               : 'body))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'list_items) in
    Obj.repr(
# 77 "parser.mly"
        ( In (BulletList(_1)) )
# 366 "parser.ml"
               : 'list_block))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Ast.node list) in
    Obj.repr(
# 81 "parser.mly"
        ( [_2] )
# 373 "parser.ml"
               : 'list_items))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : Ast.node list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'list_items) in
    Obj.repr(
# 84 "parser.mly"
        ( _2 :: _4 )
# 381 "parser.ml"
               : 'list_items))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Ast.node list) in
    Obj.repr(
# 88 "parser.mly"
        ( In (Paragraph(_1)) )
# 388 "parser.ml"
               : 'paragraph))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Ast.node list) in
    Obj.repr(
# 92 "parser.mly"
        ( In (Head(1, _2)) )
# 395 "parser.ml"
               : 'header))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Ast.node list) in
    Obj.repr(
# 94 "parser.mly"
        ( In (Head(2, _2)) )
# 402 "parser.ml"
               : 'header))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Ast.node list) in
    Obj.repr(
# 96 "parser.mly"
        ( In (Head(3, _2)) )
# 409 "parser.ml"
               : 'header))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 2 : Ast.node list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : Ast.node list) in
    Obj.repr(
# 100 "parser.mly"
        ( 
            let id_list = _1 |> String.split_on_char ',' |> List.map String.trim in
            [In (Redact (id_list,_2))] @ _4 
        )
# 421 "parser.ml"
               : Ast.node list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'inline_element) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Ast.node list) in
    Obj.repr(
# 105 "parser.mly"
        ( _1 @ _2 )
# 429 "parser.ml"
               : Ast.node list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string * string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Ast.node list) in
    Obj.repr(
# 107 "parser.mly"
        ( let (alt, src) = _1 in (In (Img(alt, src))) :: _2 )
# 437 "parser.ml"
               : Ast.node list))
; (fun __caml_parser_env ->
    Obj.repr(
# 109 "parser.mly"
        ( [] )
# 443 "parser.ml"
               : Ast.node list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'atomic_text_list) in
    Obj.repr(
# 113 "parser.mly"
        ( _1 )
# 450 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string * string) in
    Obj.repr(
# 115 "parser.mly"
        ( let (lbl, url) = _1 in [In (Link(lbl, url))] )
# 457 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 117 "parser.mly"
        ( [In (LatexBlock(_1))] )
# 464 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'italic_inline) in
    Obj.repr(
# 119 "parser.mly"
        ( [In (Bold(_2))] )
# 471 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'italic_inline) in
    Obj.repr(
# 121 "parser.mly"
        ( [In (Bold(_2))] )
# 478 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'bold_inline) in
    Obj.repr(
# 123 "parser.mly"
        ( [In (Italic(_2))] )
# 485 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'bold_inline) in
    Obj.repr(
# 125 "parser.mly"
        ( [In (Italic(_2))] )
# 492 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'atomic_text) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'italic_inline) in
    Obj.repr(
# 129 "parser.mly"
        ( _1 :: _2 )
# 500 "parser.ml"
               : 'italic_inline))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'atomic_text_list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'italic_inline) in
    Obj.repr(
# 131 "parser.mly"
        ( (In (Italic(_2))) :: _4 )
# 508 "parser.ml"
               : 'italic_inline))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'atomic_text_list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'italic_inline) in
    Obj.repr(
# 133 "parser.mly"
        ( (In (Italic(_2))) :: _4 )
# 516 "parser.ml"
               : 'italic_inline))
; (fun __caml_parser_env ->
    Obj.repr(
# 135 "parser.mly"
        ( [] )
# 522 "parser.ml"
               : 'italic_inline))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'atomic_text) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'bold_inline) in
    Obj.repr(
# 139 "parser.mly"
        ( _1 :: _2 )
# 530 "parser.ml"
               : 'bold_inline))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'atomic_text_list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'bold_inline) in
    Obj.repr(
# 141 "parser.mly"
        ( (In (Bold(_2))) :: _4 )
# 538 "parser.ml"
               : 'bold_inline))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'atomic_text_list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'bold_inline) in
    Obj.repr(
# 143 "parser.mly"
        ( (In (Bold(_2))) :: _4 )
# 546 "parser.ml"
               : 'bold_inline))
; (fun __caml_parser_env ->
    Obj.repr(
# 145 "parser.mly"
        ( [] )
# 552 "parser.ml"
               : 'bold_inline))
; (fun __caml_parser_env ->
    Obj.repr(
# 149 "parser.mly"
        ( In (Text("!")) )
# 558 "parser.ml"
               : 'atomic_text))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 151 "parser.mly"
        ( In (LatexLine(_1)) )
# 565 "parser.ml"
               : 'atomic_text))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 153 "parser.mly"
        ( In (CodeLine(_1)) )
# 572 "parser.ml"
               : 'atomic_text))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 155 "parser.mly"
        ( In (Text(_1)) )
# 579 "parser.ml"
               : 'atomic_text))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'atomic_text) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'atomic_text_list) in
    Obj.repr(
# 159 "parser.mly"
        ( _1 :: _2 )
# 587 "parser.ml"
               : 'atomic_text_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'atomic_text) in
    Obj.repr(
# 161 "parser.mly"
        ( [_1] )
# 594 "parser.ml"
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
