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
  | GE
  | EOF
  | END

open Parsing
let _ = parse_error;;
# 2 "parser.mly"
open Ast
open Utils
# 82 "parser.ml"
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
  287 (* GE *);
    0 (* EOF *);
  288 (* END *);
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
\005\000\005\000\005\000\005\000\005\000\010\000\011\000\011\000\
\009\000\012\000\012\000\008\000\007\000\007\000\007\000\002\000\
\002\000\002\000\002\000\013\000\013\000\013\000\013\000\013\000\
\013\000\013\000\015\000\015\000\015\000\015\000\016\000\016\000\
\016\000\016\000\017\000\017\000\017\000\017\000\014\000\014\000\
\000\000"

let yylen = "\002\000\
\004\000\003\000\002\000\001\000\002\000\000\000\002\000\002\000\
\002\000\002\000\002\000\002\000\001\000\001\000\003\000\004\000\
\001\000\003\000\004\000\002\000\003\000\003\000\003\000\004\000\
\002\000\002\000\000\000\001\000\001\000\001\000\003\000\003\000\
\003\000\003\000\002\000\004\000\004\000\000\000\002\000\004\000\
\004\000\000\000\001\000\001\000\001\000\001\000\002\000\001\000\
\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\049\000\000\000\000\000\000\000\004\000\
\000\000\000\000\005\000\002\000\003\000\000\000\000\000\000\000\
\000\000\000\000\046\000\000\000\000\000\000\000\000\000\043\000\
\000\000\029\000\045\000\000\000\044\000\030\000\000\000\000\000\
\013\000\000\000\000\000\000\000\000\000\000\000\000\000\014\000\
\017\000\000\000\028\000\000\000\007\000\026\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\012\000\000\000\000\000\020\000\
\001\000\008\000\009\000\010\000\011\000\025\000\047\000\021\000\
\022\000\023\000\000\000\000\000\031\000\035\000\032\000\000\000\
\000\000\034\000\039\000\033\000\000\000\000\000\018\000\000\000\
\015\000\000\000\000\000\000\000\000\000\024\000\019\000\016\000\
\037\000\036\000\040\000\041\000"

let yydgoto = "\002\000\
\004\000\034\000\005\000\010\000\035\000\007\000\036\000\037\000\
\038\000\039\000\040\000\041\000\042\000\043\000\052\000\057\000\
\044\000"

let yysindex = "\009\000\
\014\255\000\000\017\255\000\000\006\255\017\255\025\255\000\000\
\006\255\078\255\000\000\000\000\000\000\078\255\037\255\037\255\
\037\255\037\255\000\000\122\255\122\255\013\255\013\255\000\000\
\037\255\000\000\000\000\078\255\000\000\000\000\037\255\037\255\
\000\000\008\255\030\000\078\255\078\255\078\255\078\255\000\000\
\000\000\037\255\000\000\086\255\000\000\000\000\018\255\028\255\
\040\255\086\255\086\255\050\255\122\255\055\255\086\255\086\255\
\056\255\013\255\054\255\059\255\000\000\251\254\021\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\062\255\069\255\000\000\000\000\000\000\065\255\
\081\255\000\000\000\000\000\000\037\255\067\255\000\000\064\255\
\000\000\122\255\122\255\013\255\013\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\096\255\000\000\000\000\096\255\000\000\000\000\
\000\000\076\255\000\000\000\000\000\000\076\255\249\254\076\255\
\076\255\076\255\000\000\090\255\101\255\102\255\106\255\000\000\
\103\255\000\000\000\000\076\255\000\000\000\000\031\255\031\255\
\000\000\000\000\000\000\076\255\076\255\076\255\076\255\000\000\
\000\000\249\254\000\000\105\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\045\255\000\000\000\000\000\000\
\000\000\046\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\249\254\000\000\000\000\000\000\
\000\000\045\255\045\255\046\255\046\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\245\255\000\000\112\000\254\255\116\000\000\000\000\000\
\000\000\000\000\036\000\041\000\000\000\089\000\243\255\244\255\
\236\255"

let yytablesize = 150
let yytable = "\053\000\
\053\000\058\000\058\000\046\000\047\000\048\000\049\000\054\000\
\008\000\001\000\059\000\045\000\027\000\060\000\003\000\027\000\
\027\000\086\000\087\000\062\000\063\000\006\000\019\000\055\000\
\056\000\061\000\012\000\009\000\024\000\065\000\070\000\064\000\
\053\000\066\000\067\000\068\000\069\000\058\000\027\000\078\000\
\029\000\072\000\015\000\088\000\089\000\083\000\019\000\020\000\
\021\000\022\000\023\000\073\000\024\000\027\000\027\000\038\000\
\038\000\025\000\042\000\042\000\077\000\026\000\027\000\074\000\
\029\000\030\000\079\000\084\000\082\000\053\000\053\000\058\000\
\058\000\094\000\090\000\092\000\097\000\098\000\085\000\099\000\
\100\000\014\000\091\000\015\000\016\000\017\000\018\000\019\000\
\020\000\021\000\022\000\023\000\093\000\024\000\032\000\019\000\
\031\000\006\000\025\000\027\000\038\000\024\000\026\000\027\000\
\028\000\029\000\030\000\031\000\032\000\033\000\048\000\027\000\
\038\000\029\000\042\000\048\000\048\000\048\000\048\000\042\000\
\013\000\011\000\027\000\096\000\048\000\048\000\095\000\048\000\
\048\000\048\000\000\000\019\000\071\000\048\000\050\000\051\000\
\000\000\024\000\075\000\076\000\000\000\000\000\000\000\080\000\
\081\000\000\000\000\000\027\000\000\000\029\000"

let yycheck = "\020\000\
\021\000\022\000\023\000\015\000\016\000\017\000\018\000\021\000\
\003\001\001\000\023\000\014\000\020\001\025\000\001\001\023\001\
\024\001\023\001\024\001\031\000\032\000\005\001\010\001\011\001\
\012\001\028\000\002\001\022\001\016\001\000\000\042\000\024\001\
\053\000\036\000\037\000\038\000\039\000\058\000\026\001\053\000\
\028\001\024\001\006\001\023\001\024\001\058\000\010\001\011\001\
\012\001\013\001\014\001\024\001\016\001\023\001\024\001\011\001\
\012\001\021\001\013\001\014\001\011\001\025\001\026\001\024\001\
\028\001\029\001\012\001\014\001\013\001\090\000\091\000\092\000\
\093\000\085\000\013\001\011\001\090\000\091\000\020\001\092\000\
\093\000\004\001\014\001\006\001\007\001\008\001\009\001\010\001\
\011\001\012\001\013\001\014\001\012\001\016\001\031\001\010\001\
\030\001\002\001\021\001\024\001\011\001\016\001\025\001\026\001\
\027\001\028\001\029\001\030\001\031\001\032\001\006\001\026\001\
\012\001\028\001\013\001\011\001\012\001\013\001\014\001\014\001\
\009\000\006\000\020\001\088\000\020\001\021\001\086\000\023\001\
\024\001\025\001\255\255\010\001\044\000\029\001\013\001\014\001\
\255\255\016\001\050\000\051\000\255\255\255\255\255\255\055\000\
\056\000\255\255\255\255\026\001\255\255\028\001"

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
  GE\000\
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
# 286 "parser.ml"
               : string Utils.StringMap.t * (string list * string * string ) list * Ast.node list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'fields) in
    Obj.repr(
# 39 "parser.mly"
        ( _2 )
# 293 "parser.ml"
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
# 305 "parser.ml"
               : 'nav))
; (fun __caml_parser_env ->
    Obj.repr(
# 49 "parser.mly"
        ( [] )
# 311 "parser.ml"
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
# 322 "parser.ml"
               : 'fields))
; (fun __caml_parser_env ->
    Obj.repr(
# 59 "parser.mly"
        ( StringMap.empty )
# 328 "parser.ml"
               : 'fields))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'body) in
    Obj.repr(
# 63 "parser.mly"
        ( (In HorLine) :: _2 )
# 335 "parser.ml"
               : 'body))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'header) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'body) in
    Obj.repr(
# 65 "parser.mly"
        ( _1 :: _2 )
# 343 "parser.ml"
               : 'body))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'paragraph) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'body) in
    Obj.repr(
# 67 "parser.mly"
        ( _1 :: _2 )
# 351 "parser.ml"
               : 'body))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'list_block) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'body) in
    Obj.repr(
# 69 "parser.mly"
        ( _1 :: _2 )
# 359 "parser.ml"
               : 'body))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'quote_block) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'body) in
    Obj.repr(
# 71 "parser.mly"
        ( _1 :: _2 )
# 367 "parser.ml"
               : 'body))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'body) in
    Obj.repr(
# 73 "parser.mly"
        ( (In (CodeBlock(_1))) :: _2 )
# 375 "parser.ml"
               : 'body))
; (fun __caml_parser_env ->
    Obj.repr(
# 75 "parser.mly"
        ( [] )
# 381 "parser.ml"
               : 'body))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'quote_items) in
    Obj.repr(
# 79 "parser.mly"
        ( In (QuoteBlock(_1)) )
# 388 "parser.ml"
               : 'quote_block))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Ast.node list) in
    Obj.repr(
# 83 "parser.mly"
        ( [_2] )
# 395 "parser.ml"
               : 'quote_items))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : Ast.node list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'quote_items) in
    Obj.repr(
# 85 "parser.mly"
        ( _2 :: _4 )
# 403 "parser.ml"
               : 'quote_items))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'list_items) in
    Obj.repr(
# 89 "parser.mly"
        ( In (BulletList(_1)) )
# 410 "parser.ml"
               : 'list_block))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Ast.node list) in
    Obj.repr(
# 93 "parser.mly"
        ( [_2] )
# 417 "parser.ml"
               : 'list_items))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : Ast.node list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'list_items) in
    Obj.repr(
# 96 "parser.mly"
        ( _2 :: _4 )
# 425 "parser.ml"
               : 'list_items))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Ast.node list) in
    Obj.repr(
# 100 "parser.mly"
        ( In (Paragraph(_1)) )
# 432 "parser.ml"
               : 'paragraph))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Ast.node list) in
    Obj.repr(
# 104 "parser.mly"
        ( In (Head(1, _2)) )
# 439 "parser.ml"
               : 'header))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Ast.node list) in
    Obj.repr(
# 106 "parser.mly"
        ( In (Head(2, _2)) )
# 446 "parser.ml"
               : 'header))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Ast.node list) in
    Obj.repr(
# 108 "parser.mly"
        ( In (Head(3, _2)) )
# 453 "parser.ml"
               : 'header))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 2 : Ast.node list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : Ast.node list) in
    Obj.repr(
# 112 "parser.mly"
        ( 
            let id_list = _1 |> String.split_on_char ',' |> List.map String.trim in
            [In (Redact (id_list,_2))] @ _4 
        )
# 465 "parser.ml"
               : Ast.node list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'inline_element) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Ast.node list) in
    Obj.repr(
# 117 "parser.mly"
        ( _1 @ _2 )
# 473 "parser.ml"
               : Ast.node list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string * string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Ast.node list) in
    Obj.repr(
# 119 "parser.mly"
        ( let (alt, src) = _1 in (In (Img(alt, src))) :: _2 )
# 481 "parser.ml"
               : Ast.node list))
; (fun __caml_parser_env ->
    Obj.repr(
# 121 "parser.mly"
        ( [] )
# 487 "parser.ml"
               : Ast.node list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'atomic_text_list) in
    Obj.repr(
# 125 "parser.mly"
        ( _1 )
# 494 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string * string) in
    Obj.repr(
# 127 "parser.mly"
        ( let (lbl, url) = _1 in [In (Link(lbl, url))] )
# 501 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 129 "parser.mly"
        ( [In (LatexBlock(_1))] )
# 508 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'italic_inline) in
    Obj.repr(
# 131 "parser.mly"
        ( [In (Bold(_2))] )
# 515 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'italic_inline) in
    Obj.repr(
# 133 "parser.mly"
        ( [In (Bold(_2))] )
# 522 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'bold_inline) in
    Obj.repr(
# 135 "parser.mly"
        ( [In (Italic(_2))] )
# 529 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'bold_inline) in
    Obj.repr(
# 137 "parser.mly"
        ( [In (Italic(_2))] )
# 536 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'atomic_text) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'italic_inline) in
    Obj.repr(
# 141 "parser.mly"
        ( _1 :: _2 )
# 544 "parser.ml"
               : 'italic_inline))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'atomic_text_list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'italic_inline) in
    Obj.repr(
# 143 "parser.mly"
        ( (In (Italic(_2))) :: _4 )
# 552 "parser.ml"
               : 'italic_inline))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'atomic_text_list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'italic_inline) in
    Obj.repr(
# 145 "parser.mly"
        ( (In (Italic(_2))) :: _4 )
# 560 "parser.ml"
               : 'italic_inline))
; (fun __caml_parser_env ->
    Obj.repr(
# 147 "parser.mly"
        ( [] )
# 566 "parser.ml"
               : 'italic_inline))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'atomic_text) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'bold_inline) in
    Obj.repr(
# 151 "parser.mly"
        ( _1 :: _2 )
# 574 "parser.ml"
               : 'bold_inline))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'atomic_text_list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'bold_inline) in
    Obj.repr(
# 153 "parser.mly"
        ( (In (Bold(_2))) :: _4 )
# 582 "parser.ml"
               : 'bold_inline))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'atomic_text_list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'bold_inline) in
    Obj.repr(
# 155 "parser.mly"
        ( (In (Bold(_2))) :: _4 )
# 590 "parser.ml"
               : 'bold_inline))
; (fun __caml_parser_env ->
    Obj.repr(
# 157 "parser.mly"
        ( [] )
# 596 "parser.ml"
               : 'bold_inline))
; (fun __caml_parser_env ->
    Obj.repr(
# 161 "parser.mly"
        ( In (Text("!")) )
# 602 "parser.ml"
               : 'atomic_text))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 163 "parser.mly"
        ( In (LatexLine(_1)) )
# 609 "parser.ml"
               : 'atomic_text))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 165 "parser.mly"
        ( In (CodeLine(_1)) )
# 616 "parser.ml"
               : 'atomic_text))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 167 "parser.mly"
        ( In (Text(_1)) )
# 623 "parser.ml"
               : 'atomic_text))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'atomic_text) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'atomic_text_list) in
    Obj.repr(
# 171 "parser.mly"
        ( _1 :: _2 )
# 631 "parser.ml"
               : 'atomic_text_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'atomic_text) in
    Obj.repr(
# 173 "parser.mly"
        ( [_1] )
# 638 "parser.ml"
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
