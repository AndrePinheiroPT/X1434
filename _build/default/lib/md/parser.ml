type token =
  | FBEGIN
  | FEND
  | HLINE
  | FIELD of (
# 7 "parser.mly"
        string * string
# 9 "parser.ml"
)
  | H1
  | H2
  | H3
  | TXT of (
# 9 "parser.mly"
        string
# 17 "parser.ml"
)
  | DSTAR
  | STAR
  | BACKTICK
  | LBRACKET
  | RBRACKET
  | LPAREN
  | RPAREN
  | NL
  | DNL
  | EOF
  | END

open Parsing
let _ = parse_error;;
# 2 "parser.mly"
open Ast
# 35 "parser.ml"
let yytransl_const = [|
  257 (* FBEGIN *);
  258 (* FEND *);
  259 (* HLINE *);
  261 (* H1 *);
  262 (* H2 *);
  263 (* H3 *);
  265 (* DSTAR *);
  266 (* STAR *);
  267 (* BACKTICK *);
  268 (* LBRACKET *);
  269 (* RBRACKET *);
  270 (* LPAREN *);
  271 (* RPAREN *);
  272 (* NL *);
  273 (* DNL *);
    0 (* EOF *);
  274 (* END *);
    0|]

let yytransl_block = [|
  260 (* FIELD *);
  264 (* TXT *);
    0|]

let yylhs = "\255\255\
\001\000\004\000\005\000\005\000\003\000\003\000\003\000\003\000\
\007\000\006\000\006\000\006\000\002\000\002\000\008\000\008\000\
\008\000\010\000\010\000\010\000\011\000\011\000\011\000\012\000\
\012\000\009\000\009\000\000\000"

let yylen = "\002\000\
\003\000\003\000\002\000\000\000\002\000\002\000\002\000\001\000\
\002\000\003\000\003\000\003\000\002\000\000\000\001\000\003\000\
\003\000\002\000\004\000\000\000\002\000\004\000\000\000\001\000\
\001\000\002\000\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\028\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\024\000\000\000\000\000\025\000\008\000\
\000\000\000\000\000\000\000\000\000\000\015\000\000\000\003\000\
\002\000\005\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\009\000\001\000\006\000\007\000\013\000\
\026\000\010\000\011\000\012\000\000\000\016\000\018\000\000\000\
\017\000\021\000\000\000\000\000\019\000\022\000"

let yydgoto = "\002\000\
\004\000\017\000\018\000\005\000\007\000\019\000\020\000\021\000\
\022\000\031\000\034\000\023\000"

let yysindex = "\003\000\
\004\255\000\000\002\255\000\000\007\255\002\255\005\255\007\255\
\000\255\001\255\003\255\000\000\032\255\036\255\000\000\000\000\
\009\255\027\000\007\255\007\255\027\255\000\000\025\255\000\000\
\000\000\000\000\011\255\015\255\033\255\025\255\040\255\032\255\
\025\255\041\255\036\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\043\255\000\000\000\000\046\255\
\000\000\000\000\032\255\036\255\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\054\255\000\000\042\255\054\255\000\000\042\255\
\000\000\000\000\000\000\000\000\048\255\050\255\000\000\000\000\
\000\000\000\000\042\255\042\255\042\255\000\000\037\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\048\255\
\000\000\000\000\050\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\048\255\050\255\000\000\000\000"

let yygindex = "\000\000\
\000\000\037\000\010\000\000\000\055\000\000\000\000\000\000\000\
\001\000\226\255\224\255\243\255"

let yytablesize = 61
let yytable = "\032\000\
\035\000\047\000\050\000\001\000\003\000\006\000\025\000\027\000\
\028\000\008\000\029\000\009\000\010\000\011\000\012\000\013\000\
\014\000\026\000\032\000\054\000\053\000\035\000\015\000\041\000\
\016\000\036\000\037\000\042\000\038\000\039\000\045\000\043\000\
\012\000\048\000\012\000\013\000\014\000\032\000\035\000\012\000\
\015\000\030\000\015\000\012\000\033\000\027\000\027\000\015\000\
\046\000\044\000\049\000\015\000\051\000\027\000\052\000\004\000\
\020\000\040\000\014\000\023\000\024\000"

let yycheck = "\013\000\
\014\000\032\000\035\000\001\000\001\001\004\001\002\001\008\001\
\008\001\003\001\008\001\005\001\006\001\007\001\008\001\009\001\
\010\001\008\000\032\000\052\000\051\000\035\000\016\001\023\000\
\018\001\017\001\000\000\017\001\019\000\020\000\030\000\017\001\
\008\001\033\000\008\001\009\001\010\001\051\000\052\000\008\001\
\016\001\010\001\016\001\008\001\009\001\009\001\010\001\016\001\
\009\001\017\001\010\001\016\001\010\001\017\001\009\001\002\001\
\009\001\021\000\017\001\010\001\006\000"

let yynames_const = "\
  FBEGIN\000\
  FEND\000\
  HLINE\000\
  H1\000\
  H2\000\
  H3\000\
  DSTAR\000\
  STAR\000\
  BACKTICK\000\
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
  TXT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'head) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Ast.block list) in
    Obj.repr(
# 27 "parser.mly"
        ( Ast.Doc(_1,_2) )
# 162 "parser.ml"
               : Ast.doc))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'fields) in
    Obj.repr(
# 31 "parser.mly"
        ( _2 )
# 169 "parser.ml"
               : 'head))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string * string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fields) in
    Obj.repr(
# 35 "parser.mly"
        ( let (k,v) = _1 in Ast.Field(k,v) :: _2 )
# 177 "parser.ml"
               : 'fields))
; (fun __caml_parser_env ->
    Obj.repr(
# 37 "parser.mly"
        ( [] )
# 183 "parser.ml"
               : 'fields))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Ast.block list) in
    Obj.repr(
# 41 "parser.mly"
        ( Ast.HorLine :: _2 )
# 190 "parser.ml"
               : Ast.block list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'header) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Ast.block list) in
    Obj.repr(
# 43 "parser.mly"
        ( _1 :: _2 )
# 198 "parser.ml"
               : Ast.block list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'paragraph) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Ast.block list) in
    Obj.repr(
# 45 "parser.mly"
        ( _1 :: _2 )
# 206 "parser.ml"
               : Ast.block list))
; (fun __caml_parser_env ->
    Obj.repr(
# 47 "parser.mly"
        ( [] )
# 212 "parser.ml"
               : Ast.block list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Ast.inline list) in
    Obj.repr(
# 51 "parser.mly"
        ( Ast.Paragraph(_1) )
# 219 "parser.ml"
               : 'paragraph))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 55 "parser.mly"
        ( Ast.Head(1, _2) )
# 226 "parser.ml"
               : 'header))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 57 "parser.mly"
        ( Ast.Head(2, _2) )
# 233 "parser.ml"
               : 'header))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 59 "parser.mly"
        ( Ast.Head(3, _2) )
# 240 "parser.ml"
               : 'header))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'inline_element) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Ast.inline list) in
    Obj.repr(
# 63 "parser.mly"
        ( _1 @ _2 )
# 248 "parser.ml"
               : Ast.inline list))
; (fun __caml_parser_env ->
    Obj.repr(
# 65 "parser.mly"
        ( [] )
# 254 "parser.ml"
               : Ast.inline list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'atomic_text_list) in
    Obj.repr(
# 69 "parser.mly"
        ( _1 )
# 261 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'italic_inline) in
    Obj.repr(
# 71 "parser.mly"
        ( [Ast.Bold(_2)] )
# 268 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'bold_inline) in
    Obj.repr(
# 73 "parser.mly"
        ( [Ast.Italic(_2)] )
# 275 "parser.ml"
               : 'inline_element))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'atomic_text) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'italic_inline) in
    Obj.repr(
# 77 "parser.mly"
        ( _1 :: _2 )
# 283 "parser.ml"
               : 'italic_inline))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'atomic_text_list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'italic_inline) in
    Obj.repr(
# 79 "parser.mly"
        ( Ast.Italic(_2) :: _4 )
# 291 "parser.ml"
               : 'italic_inline))
; (fun __caml_parser_env ->
    Obj.repr(
# 81 "parser.mly"
        ( [] )
# 297 "parser.ml"
               : 'italic_inline))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'atomic_text) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'bold_inline) in
    Obj.repr(
# 85 "parser.mly"
        ( _1 :: _2 )
# 305 "parser.ml"
               : 'bold_inline))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'atomic_text_list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'bold_inline) in
    Obj.repr(
# 87 "parser.mly"
        ( Ast.Bold(_2) :: _4 )
# 313 "parser.ml"
               : 'bold_inline))
; (fun __caml_parser_env ->
    Obj.repr(
# 89 "parser.mly"
        ( [] )
# 319 "parser.ml"
               : 'bold_inline))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 93 "parser.mly"
        ( Ast.Text(_1) )
# 326 "parser.ml"
               : 'atomic_text))
; (fun __caml_parser_env ->
    Obj.repr(
# 95 "parser.mly"
        ( Ast.Break )
# 332 "parser.ml"
               : 'atomic_text))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'atomic_text) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'atomic_text_list) in
    Obj.repr(
# 99 "parser.mly"
        ( _1 :: _2 )
# 340 "parser.ml"
               : 'atomic_text_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'atomic_text) in
    Obj.repr(
# 101 "parser.mly"
        ( [_1] )
# 347 "parser.ml"
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
