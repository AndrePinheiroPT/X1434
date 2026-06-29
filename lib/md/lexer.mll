{
open Parser

let beg = ref true
}

let whitespace = [' ' '\t']
let text = [^ '!' '#' '>' '$' '*' '_' '-' '`' '[' ']' '{' '}' '(' ')' '\\' '\n']+

rule token = parse
  | "%--" [' ' '\t' '\n']* { FBEGIN }
  | "-%-" [' ' '\t' '\n']* { FMID }
  | "--%" [' ' '\t' '\n']* { FEND }
  | "%%%"                  { END }
  | (['a'-'z' 'A'-'Z' '_']+ as key) ':' [' ' '\t']* '"' ([^ '"']* as value) '"' [' ' '\t' '\n']+
    { FIELD(key,value) }   
  | '{' ([^'}']* as arr) '}' '[' ([^']']+ as alt) "]("  ([^ ')']* as url) ')' [' ' '\t' '\n']+
    { NAV(arr,alt,url) }   
  | "![" ([^ ']' ]+ as alt) "](" ([^ ')']* as url) ')' 
    { IMG(alt,url) }
  | "!{" (([^ ',' '}' ]+ (',' [^ ',' '}' ]+)*) as arr) "}("      
    { LREDA(arr) }
  | '[' ([^ ']' ]+ as alt) "](" ([^ ')']* as url) ')' 
    { LINK(alt,url) } 
  | '`' ([^ '`']+ as code)  '`'     { CODELINE(code) }
  | "```" ([^ '`']+ as code) "```"  { CODEBLOCK(code) }
  | '$' ([^ '$']+ as code)  '$'     { LATEXLINE(code) }
  | "$$" ([^ '$']+ as code) "$$"    { LATEXBLOCK(code) }
  | "---"             { HLINE }
  | "### "            { H3 }
  | "## "             { H2 }
  | "# "              { H1 }
  | "\\-"             { TXT("-") }
  | "\\_"             { TXT("_") }
  | "\\*"             { TXT("*") }
  | "\\`"             { TXT("`") }
  | "\\["             { TXT("[") }
  | "\\]"             { TXT("]") }
  | "\\("             { TXT("(") }
  | "\\)"             { TXT(")") }
  | "\\!"             { TXT("!") }
  | "\\#"             { TXT("#") }
  | "\\>"             { TXT(">") }
  | "> "              { GE }
  | "- "              { BULLET }
  | "__"              { DULINE }
  | "_"               { ULINE }
  | "**"              { DSTAR }
  | "*"               { STAR }
  | "`"               { BACKTICK }
  | "["               { LBRACKET }
  | "]"               { RBRACKET }
  | "("               { LPAREN }
  | ")"               { RPAREN }
  | '!'               { EXCLA }
  | '\n''\n'+         { DNL }
  | '\n' whitespace*  { NL }
  | text as s         { TXT(s) }
  | whitespace+       { token lexbuf } 
  | eof               { EOF }
