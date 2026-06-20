type field = Field of string * string  

type inline = 
  | Break
  | Text of string 
  | Italic of inline list
  | Bold of inline list
  | Redact of string * inline list
  | Img of string * string
  | Link of string * string
  | CodeLine of string
  | CodeBlock of string
  | LatexLine of string
  | LatexBlock of string

type block =
  | Head of (int * (inline list))
  | HorLine 
  | Paragraph of inline list
  

type doc = Doc of field list * block list

let rec render_inline = function
  | Break -> "\n"
  | Text(s) -> s
  | Italic(xs) -> "Italic("^ render_inlines xs ^")"
  | Bold(xs) -> "Bold("^ render_inlines xs ^")"
  | Redact(xy, xs) -> "Redact("^ xy ^","^render_inlines xs ^")"
  | Img(alt,url) -> "Img("^ alt ^","^url^")"
  | Link(alt,url) -> "Link("^ alt ^","^url^")"
  | CodeLine(code) -> "CodeLine"^code
  | CodeBlock(code) -> "CodeBlock"^code
  | LatexLine(code) -> "LatexLine"^code
  | LatexBlock(code) -> "LatexBlock"^code

and render_inlines xs = xs |> List.map render_inline |> String.concat ", " 

let render_block = function
  | Head(i,s) -> "Head("^ string_of_int i ^ ", {"^ render_inlines s ^"})"
  | HorLine -> "HorizontalLine"
  | Paragraph(xs) -> render_inlines xs 

let render_doc (Doc(fs, bs)) = 
  let render_fields = fs |> List.map (fun (Field(k,v)) -> "{"^k^", "^v^"}") |> String.concat ", " in
  let render_blocks = bs |> List.map (render_block) |> String.concat ", " in
  "[" ^ render_fields ^ "] (" ^ render_blocks ^ ")"
