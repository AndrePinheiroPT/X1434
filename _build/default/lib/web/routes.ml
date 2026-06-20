open Html_renderer.Html
open Md

module StringMap = Map.Make(String)

let md_to_doc file_path = (In_channel.open_bin file_path) |> Markdown.parse 
let build_route (m, tyx) = 
  let route = match StringMap.find_opt "route" m with
    | Some v -> v
    | None -> ""
  in
  let blocked_list = match StringMap.find_opt "block" m with
    | Some v -> v |> String.split_on_char ','
    | None -> []
  in
  
  Dream.get route (fun req ->
    match Dream.query req "id" with
      | Some v -> 
        if List.mem v blocked_list then Dream.redirect req "/block" 
        else Dream.html (Format.asprintf "%a" (Tyxml.Html.pp ()) tyx)
      | None -> 
        if List.is_empty blocked_list then Dream.html (Format.asprintf "%a" (Tyxml.Html.pp ()) tyx)
        else Dream.redirect req "/block" 
  )

let routes = 
  let (>>) f g x = g(f(x)) in
  md_files "content"
  |> List.map (md_to_doc >> render_doc >> build_route)
  |> fun lst -> [Dream.get "/static/**" (Dream.static "static")] @ lst 
  