type token =
  | FBEGIN
  | FMID
  | FEND
  | HLINE
  | FIELD of (
# 8 "parser.mly"
        string * string
# 10 "parser.mli"
)
  | IMG of (
# 9 "parser.mly"
        string * string
# 15 "parser.mli"
)
  | H1
  | H2
  | H3
  | TXT of (
# 11 "parser.mly"
        string
# 23 "parser.mli"
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
# 38 "parser.mli"
)
  | NAV of (
# 18 "parser.mly"
        string * string * string
# 43 "parser.mli"
)
  | NL
  | DNL
  | LINK of (
# 20 "parser.mly"
        string * string
# 50 "parser.mli"
)
  | CODELINE of (
# 21 "parser.mly"
        string
# 55 "parser.mli"
)
  | CODEBLOCK of (
# 21 "parser.mly"
        string
# 60 "parser.mli"
)
  | LATEXLINE of (
# 22 "parser.mly"
        string
# 65 "parser.mli"
)
  | LATEXBLOCK of (
# 22 "parser.mly"
        string
# 70 "parser.mli"
)
  | BULLET
  | EOF
  | END

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> string Utils.StringMap.t * (string list * string * string ) list * Ast.node list
