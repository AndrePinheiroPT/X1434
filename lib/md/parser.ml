type token =
  | FBEGIN
  | FEND
  | HLINE
  | FIELD of (
# 7 "parser.mly"
        string * string
# 9 "parser.ml"
)
  | IMG of (
# 8 "parser.mly"
        string * string
# 14 "parser.ml"
)
  | H1
  | H2
  | H3
  | TXT of (
# 10 "parser.mly"
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
# 16 "parser.mly"
        string
# 37 "parser.ml"
)
  | NL
  | DNL
  | LINK of (
# 18 "parser.mly"
        string * string
# 44 "parser.ml"
)
  | CODELINE of (
# 19 "parser.mly"
        string
# 49 "parser.ml"
)
  | CODEBLOCK of (
# 19 "parser.mly"
        string
# 54 "parser.ml"
)
  | LATEXLINE of (
# 20 "parser.mly"
        string
# 59 "parser.ml"
)
  | LATEXBLOCK of (
# 20 "parser.mly"
        string
# 64 "parser.ml"
)
  | EOF
  | END

open Parsing
let _ = parse_error;;
# 2 "parser.mly"
open Ast
# 73 "parser.ml"
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
\001\000\004\000\005\000\005\000\003\000\003\000\003\000\003\000\
\007\000\006\000\006\000\006\000\002\000\002\000\002\000\008\000\
\008\000\008\000\008\000\008\000\008\000\008\000\008\000\008\000\
\008\000\008\000\010\000\010\000\010\000\010\000\011\000\011\000\
\011\000\011\000\012\000\012\000\012\000\009\000\009\000\000\000"

let yylen = "\002\000\
\003\000\003\000\002\000\000\000\002\000\002\000\002\000\001\000\
\002\000\003\000\003\000\003\000\004\000\002\000\000\000\001\000\
\001\000\001\000\001\000\001\000\001\000\001\000\003\000\003\000\
\003\000\003\000\002\000\004\000\004\000\000\000\002\000\004\000\
\004\000\000\000\001\000\001\000\001\000\002\000\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\040\000\000\000\000\000\000\000\000\000\
\017\000\000\000\000\000\000\000\036\000\000\000\000\000\000\000\
\000\000\035\000\000\000\037\000\018\000\019\000\020\000\021\000\
\022\000\008\000\000\000\000\000\000\000\000\000\000\000\016\000\
\000\000\003\000\002\000\005\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\009\000\001\000\006\000\007\000\014\000\038\000\
\010\000\011\000\012\000\000\000\000\000\023\000\027\000\024\000\
\000\000\000\000\026\000\031\000\025\000\000\000\000\000\000\000\
\000\000\000\000\013\000\029\000\028\000\032\000\033\000"

let yydgoto = "\002\000\
\004\000\027\000\028\000\005\000\007\000\029\000\030\000\031\000\
\032\000\042\000\047\000\033\000"

let yysindex = "\006\000\
\011\255\000\000\014\255\000\000\069\255\014\255\022\255\069\255\
\000\000\093\255\093\255\093\255\000\000\027\255\027\255\040\255\
\040\255\000\000\093\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\006\255\035\000\069\255\069\255\093\255\000\000\
\002\255\000\000\000\000\000\000\015\255\019\255\021\255\002\255\
\002\255\034\255\027\255\035\255\002\255\002\255\041\255\040\255\
\039\255\028\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\042\255\043\255\000\000\000\000\000\000\
\052\255\054\255\000\000\000\000\000\000\093\255\027\255\027\255\
\040\255\040\255\000\000\000\000\000\000\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\061\255\000\000\046\255\061\255\000\000\046\255\
\000\000\046\255\046\255\046\255\000\000\059\255\062\255\071\255\
\072\255\000\000\067\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\046\255\046\255\000\255\000\000\
\116\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\016\255\000\000\000\000\000\000\000\000\020\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\255\016\255\016\255\
\020\255\020\255\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\250\255\001\000\000\000\081\000\000\000\000\000\000\000\
\231\255\251\255\253\255\242\255"

let yytablesize = 143
let yytable = "\043\000\
\043\000\048\000\048\000\037\000\038\000\039\000\001\000\056\000\
\036\000\044\000\013\000\003\000\050\000\049\000\060\000\061\000\
\018\000\006\000\015\000\065\000\066\000\015\000\020\000\035\000\
\055\000\030\000\030\000\051\000\043\000\053\000\054\000\034\000\
\034\000\048\000\052\000\013\000\057\000\063\000\040\000\041\000\
\058\000\018\000\059\000\062\000\068\000\064\000\070\000\020\000\
\013\000\045\000\046\000\069\000\067\000\071\000\018\000\072\000\
\043\000\043\000\048\000\048\000\020\000\073\000\004\000\075\000\
\074\000\076\000\077\000\015\000\030\000\078\000\079\000\008\000\
\030\000\009\000\010\000\011\000\012\000\013\000\014\000\015\000\
\016\000\017\000\034\000\018\000\034\000\015\000\034\000\000\000\
\019\000\020\000\000\000\021\000\022\000\023\000\024\000\025\000\
\026\000\009\000\000\000\000\000\000\000\013\000\014\000\015\000\
\016\000\017\000\000\000\018\000\000\000\000\000\000\000\000\000\
\019\000\020\000\000\000\021\000\022\000\023\000\024\000\025\000\
\039\000\000\000\000\000\000\000\000\000\039\000\039\000\039\000\
\039\000\000\000\000\000\000\000\000\000\000\000\039\000\039\000\
\000\000\039\000\039\000\039\000\039\000\039\000\039\000"

let yycheck = "\014\000\
\015\000\016\000\017\000\010\000\011\000\012\000\001\000\033\000\
\008\000\015\000\009\001\001\001\019\000\017\000\040\000\041\000\
\015\001\004\001\019\001\045\000\046\000\022\001\021\001\002\001\
\031\000\010\001\011\001\022\001\043\000\029\000\030\000\012\001\
\013\001\048\000\000\000\009\001\022\001\043\000\012\001\013\001\
\022\001\015\001\022\001\010\001\048\000\011\001\019\001\021\001\
\009\001\010\001\011\001\013\001\012\001\012\001\015\001\013\001\
\071\000\072\000\073\000\074\000\021\001\010\001\002\001\070\000\
\011\001\071\000\072\000\022\001\010\001\073\000\074\000\003\001\
\011\001\005\001\006\001\007\001\008\001\009\001\010\001\011\001\
\012\001\013\001\012\001\015\001\013\001\019\001\006\000\255\255\
\020\001\021\001\255\255\023\001\024\001\025\001\026\001\027\001\
\028\001\005\001\255\255\255\255\255\255\009\001\010\001\011\001\
\012\001\013\001\255\255\015\001\255\255\255\255\255\255\255\255\
\020\001\021\001\255\255\023\001\024\001\025\001\026\001\027\001\
\005\001\255\255\255\255\255\255\255\255\010\001\011\001\012\001\
\013\001\255\255\255\255\255\255\255\255\255\255\019\001\020\001\
\255\255\022\001\023\001\024\001\025\001\026\001\027\001"

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
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Ast.block list) in
    Obj.repr(
# 33 "parser.mly"
        ( Ast.Doc(_1,_2) )
# 251 "parser.ml"
               : Ast.doc))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'fields) in
    Obj.repr(
# 37 "parser.mly"
        ( _2 )
# 258 "parser.ml"
               : 'head))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string * string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fields) in
    Obj.repr(
# 41 "parser.mly"
        ( let (k,v) = _1 in Ast.Field(k,v) :: _2 )
# 266 "parser.ml"
               : 'fields))
; (fun __caml_parser_env ->
    Obj.repr(
# 43 "parser.mly"
        ( [] )
# 272 "parser.ml"
               : 'fields))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Ast.block list) in
    Obj.repr(
# 47 "parser.mly"
        ( Ast.HorLine :: _2 )
# 279 "parser.ml"
               : Ast.block list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'header) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Ast.block list) in
    Obj.repr(
# 49 "parser.mly"
        ( _1 :: _2 )
# 287 "parser.ml"
               : Ast.block list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'paragraph) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Ast.block list) in
    Obj.repr(
# 51 "parser.mly"
        ( _1 :: _2 )
# 295 "parser.ml"
               : Ast.block list))
; (fun __caml_parser_env ->
    Obj.repr(
# 53 "parser.mly"
        ( [] )
# 301 "parser.ml"
               : Ast.block list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Ast.inline list) in
    Obj.repr(
# 57 "parser.mly"
        ( Ast.Paragraph(_1) )
# 308 "parser.ml"
               : 'paragraph))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Ast.inline list) in
    Obj.repr(
# 61 "parser.mly"
        ( Ast.Head(1, _2) )
# 315 "parser.ml"
               : 'header))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Ast.inline list) in
    Obj.repr(
# 63 "parser.mly"
        ( Ast.Head(2, _2) )
# 322 "parser.ml"
               : 'header))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Ast.inline list) in
    Obj.repr(
# 65 "parser.mly"
        ( Ast.Head(3, _2) )
# 329 "parser.ml"
               : 'header))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 2 : Ast.inline list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : Ast.inline list) in
    Obj.repr(
# 69 "parser.mly"
        ( [Ast.Redact(_1,_2)] @ _4 )
# 338 "parser.ml"
               : Ast.inline list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'inline_element) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Ast.inline list) in
    Obj.repr(
# 71 "parser.mly"
        ( _1 @ _2 )
# 346 "parser.ml"
               : Ast.inline list))
; (fun __caml_parser_env ->
    Obj.repr(
# 73 "parser.mly"
        ( [] )
# 352 "parser.ml"
               : Ast.inline list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'atomic_text_list) in
    Obj.repr(
# 77 "parser.mly"
        ( _1 )
# 359 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string * string) in
    Obj.repr(
# 79 "parser.mly"
        ( [_1 |> (fun (x,y) -> Ast.Img(x,y))] )
# 366 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string * string) in
    Obj.repr(
# 81 "parser.mly"
        ( [_1 |> (fun (x,y) -> Ast.Link(x,y))] )
# 373 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 83 "parser.mly"
        ( [Ast.CodeLine(_1)] )
# 380 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 85 "parser.mly"
        ( [Ast.CodeBlock(_1)] )
# 387 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 87 "parser.mly"
        ( [Ast.LatexLine(_1)] )
# 394 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 89 "parser.mly"
        ( [Ast.LatexBlock(_1)] )
# 401 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'italic_inline) in
    Obj.repr(
# 91 "parser.mly"
        ( [Ast.Bold(_2)] )
# 408 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'italic_inline) in
    Obj.repr(
# 93 "parser.mly"
        ( [Ast.Bold(_2)] )
# 415 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'bold_inline) in
    Obj.repr(
# 95 "parser.mly"
        ( [Ast.Italic(_2)] )
# 422 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'bold_inline) in
    Obj.repr(
# 97 "parser.mly"
        ( [Ast.Italic(_2)] )
# 429 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'atomic_text) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'italic_inline) in
    Obj.repr(
# 101 "parser.mly"
        ( _1 :: _2 )
# 437 "parser.ml"
               : 'italic_inline))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'atomic_text_list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'italic_inline) in
    Obj.repr(
# 103 "parser.mly"
        ( Ast.Italic(_2) :: _4 )
# 445 "parser.ml"
               : 'italic_inline))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'atomic_text_list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'italic_inline) in
    Obj.repr(
# 105 "parser.mly"
        ( Ast.Italic(_2) :: _4 )
# 453 "parser.ml"
               : 'italic_inline))
; (fun __caml_parser_env ->
    Obj.repr(
# 107 "parser.mly"
        ( [] )
# 459 "parser.ml"
               : 'italic_inline))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'atomic_text) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'bold_inline) in
    Obj.repr(
# 111 "parser.mly"
        ( _1 :: _2 )
# 467 "parser.ml"
               : 'bold_inline))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'atomic_text_list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'bold_inline) in
    Obj.repr(
# 113 "parser.mly"
        ( Ast.Bold(_2) :: _4 )
# 475 "parser.ml"
               : 'bold_inline))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'atomic_text_list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'bold_inline) in
    Obj.repr(
# 115 "parser.mly"
        ( Ast.Bold(_2) :: _4 )
# 483 "parser.ml"
               : 'bold_inline))
; (fun __caml_parser_env ->
    Obj.repr(
# 117 "parser.mly"
        ( [] )
# 489 "parser.ml"
               : 'bold_inline))
; (fun __caml_parser_env ->
    Obj.repr(
# 121 "parser.mly"
        ( Ast.Text("!") )
# 495 "parser.ml"
               : 'atomic_text))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 123 "parser.mly"
        ( Ast.Text(_1) )
# 502 "parser.ml"
               : 'atomic_text))
; (fun __caml_parser_env ->
    Obj.repr(
# 125 "parser.mly"
        ( Ast.Break )
# 508 "parser.ml"
               : 'atomic_text))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'atomic_text) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'atomic_text_list) in
    Obj.repr(
# 129 "parser.mly"
        ( _1 :: _2 )
# 516 "parser.ml"
               : 'atomic_text_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'atomic_text) in
    Obj.repr(
# 131 "parser.mly"
        ( [_1] )
# 523 "parser.ml"
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
   (Parsing.yyparse yytables 1 lexfun lexbuf : Ast.doc)
