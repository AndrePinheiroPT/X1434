type token =
  | FBEGIN
  | FEND
  | HLINE
  | FIELD of (
# 7 "parser.mly"
        string * string
# 9 "parser.mli"
)
  | IMG of (
# 8 "parser.mly"
        string * string
# 14 "parser.mli"
)
  | H1
  | H2
  | H3
  | TXT of (
# 10 "parser.mly"
        string
# 22 "parser.mli"
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
# 37 "parser.mli"
)
  | NL
  | DNL
  | LINK of (
# 18 "parser.mly"
        string * string
# 44 "parser.mli"
)
  | CODELINE of (
# 19 "parser.mly"
        string
# 49 "parser.mli"
)
  | CODEBLOCK of (
# 19 "parser.mly"
        string
# 54 "parser.mli"
)
  | LATEXLINE of (
# 20 "parser.mly"
        string
# 59 "parser.mli"
)
  | LATEXBLOCK of (
# 20 "parser.mly"
        string
# 64 "parser.mli"
)
  | EOF
  | END

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.doc
