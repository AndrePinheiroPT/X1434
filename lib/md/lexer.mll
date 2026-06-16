{
open Parser
}

let whitespace = [' ' '\t']
let text = [^ '#' '$' '*' '`' '[' ']' '(' ')' '\n']+

rule token = parse
  | "%--" [' ' '\t' '\n']* { FBEGIN }
  | "--%" [' ' '\t' '\n']* { FEND }
  | "%%%"            { END }
  | (['a'-'z' 'A'-'Z' '_']+ as key) ':' [' ' '\t']* '"' ([^ '"']* as value) '"' [' ' '\t' '\n']+
    { FIELD(key,value) }   
  | "---"          { HLINE }
  | "### "          { H3 }
  | "## "           { H2 }
  | "# "            { H1 }
  | "**"           { DSTAR }
  | "*"            { STAR }
  | "`"            { BACKTICK }
  | "["            { LBRACKET }
  | "]"            { RBRACKET }
  | "("            { LPAREN }
  | ")"            { RPAREN }
  | '\n''\n'+      { DNL }
  | '\n'           { NL }
  | whitespace+    { token lexbuf } 
  | text as s      { TXT(s) }
  | eof            { EOF }
