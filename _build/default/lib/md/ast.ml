module StringMap = Map.Make(String)

type field = Field of string * string  

type 'a node_f = 
  | Break
  | HorLine 

  | Text of string 
  | CodeLine of string
  | LatexLine of string
  | LatexBlock of string
  | CodeBlock of string
  | Img of string * string
  | Link of string * string

  | Italic of 'a list
  | Bold of 'a list
  | Paragraph of 'a list
  
  | Head of (int * ('a list))
  | Redact of (string list * 'a list)

type node = In of node node_f
let out (In n) = n

let fmap g = function 
  | Break -> Break
  | HorLine -> HorLine

  | Text s -> Text s
  | CodeLine s -> CodeLine s
  | LatexLine s -> LatexLine s
  | LatexBlock s -> LatexBlock s
  | CodeBlock s -> CodeBlock s
  | Img (a,s) -> Img (a,s)
  | Link (a,s) -> Link (a,s)

  | Italic l -> Italic (List.map g l)
  | Bold l -> Bold (List.map g l)
  | Paragraph l -> Paragraph (List.map g l)

  | Head (i,l) -> Head (i, List.map g l)
  | Redact (ls,l) -> Redact (ls, List.map g l)

let rec cata gene n = n |> out |> fmap (cata gene) |> gene




