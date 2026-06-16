type token =
  | FBEGIN
  | FEND
  | HLINE
  | FIELD of (
# 7 "parser.mly"
        string * string
# 9 "parser.mli"
)
  | H1
  | H2
  | H3
  | TXT of (
# 9 "parser.mly"
        string
# 17 "parser.mli"
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

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.doc
