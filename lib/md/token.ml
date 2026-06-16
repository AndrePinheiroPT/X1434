type tok = 
  | FBEGIN
  | FEND
  | END
  | HLINE
  | FIELD of string * string 
  | H1
  | H2
  | H3
  | TXT of string
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
