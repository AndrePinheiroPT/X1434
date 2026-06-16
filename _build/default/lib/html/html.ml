open Tyxml.Html
open Md.Ast

let rec render_inline = function
  | Break -> br ()
  | Text(s) -> txt s
  | Italic(xs) -> i ( render_inlines xs )
  | Bold (xs) -> b ( render_inlines xs )
and render_inlines xs = xs |> List.map render_inline 

let render_block = function
  | Head(i,s) -> 
    begin match i with
      | 1 -> h1 [txt s]
      | 2 -> h2 [txt s]
      | 3 -> h3 [txt s]
      | _ -> h3 [txt s]
    end
  | HorLine -> hr ()
  | Paragraph(xs) -> p (render_inlines xs )

let render_fields fs = () 

let render_doc (Doc(fs, bs)) = bs |> List.map (render_block) |> Index.index