open Parser
open Ast
let get_token_list lexbuf = 
  let rec work acc = 
    match Lexer.token lexbuf with
    | EOF -> List.rev (EOF :: acc)
    | t -> work (t::acc)
  in work []

let pp_token = function 
  | H1 -> "H1"
  | H2 -> "H2"
  | H3 -> "H3"
  | TXT(s) -> "TXT("^s^")" 
  | DSTAR -> "DSTAR"
  | STAR -> "STAR"
  | BACKTICK -> "BACKTICK" 
  | LBRACKET -> "LBRACKET"
  | RBRACKET -> "RBRACKET"
  | LPAREN -> "LPAREN"
  | RPAREN -> "RPAREN"
  | NL -> "NL"
  | DNL -> "DNL"
  | EOF -> "EOF"
  | END -> "END"
  | HLINE -> "HLINE"
  | FEND -> "FEND"
  | FBEGIN -> "FBEGIN"
  | FIELD(k,v) -> "FIELD("^k^","^v^")"

let debug_token lexbuf =
  let tok = Lexer.token lexbuf in
  print_endline (pp_token tok);
  tok

let parse file = 
  let lexbuf = Lexing.from_channel file in 
  let res = Parser.main debug_token lexbuf in
  res
