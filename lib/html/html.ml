open Tyxml.Html
open Md.Ast

let rec render_inline = function
  | Break -> br ()
  | Text(s) -> txt s
  | Italic(xs) -> i ( render_inlines xs )
  | Bold (xs) -> b ( render_inlines xs )
and render_inlines xs = xs |> List.map render_inline 

let render_block _ = function
  | Head(i,s) -> 
    begin match i with
      | 1 -> h1 [txt s]
      | 2 -> h2 [txt s]
      | 3 -> h3 [txt s]
      | _ -> h3 [txt s]
    end
  | HorLine -> hr ()
  | Paragraph(xs) -> p (render_inlines xs )


let rec md_files dir = 
  Sys.readdir dir
  |> Array.to_list
  |> List.concat_map (fun name ->
    let path = Filename.concat dir name in
    if Sys.is_directory path then md_files path
    else if Filename.check_suffix path ".md" then [path]
    else []
  )

module StringMap = Map.Make(String)

let process_fields fs = List.fold_left (fun acc (Field(k,v)) -> StringMap.add k v acc) StringMap.empty fs 


let render_doc (Doc(fs, bs)) = 
  (process_fields fs) 
  |> fun x -> (x, bs |> List.map (render_block x))
  |> fun (x, h) -> (x, Index.main x h)