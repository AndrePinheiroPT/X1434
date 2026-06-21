open Html_renderer.Html
open Html_renderer
open Md.Utils
open Md.Utils.Option
open Md
open Ast

let md_to_doc file_path = (In_channel.open_bin file_path) |> Markdown.parse 

let verify id asg = true

let product ma mb = 
  ma >>= fun a -> 
  mb >>= fun b -> 
  return (a, b)

let verify (id, asg) = Some id

let block blocked_list id = if List.mem id blocked_list then None else Some id

let valid ids_set id = if StringSet.mem id ids_set then Some id else None

let block_list m = match StringMap.find_opt "block" m with | Some v -> String.split_on_char ',' v | None -> []

let build_route (m,bs,valid_ids)  = 
  let route = match StringMap.find_opt "route" m with | Some v -> v | None -> "/" in
  let handler = fun req -> 
    let id = Dream.query req "id" in
    let asg = Dream.query req "asg" in
    
    let binding_pipe = 
      product id asg
      >>= verify
      >>= (valid valid_ids)
      >>= (block (block_list m))
      >>= (fun valid_id ->
        let reduced_nodes = List.concat_map (cata (gene_reduce valid_id)) bs in  
        let html_elements = List.map (cata gene_html) reduced_nodes in
          return (Index.main m html_elements)
        )
    in
    match binding_pipe with 
    | Some tyxml_doc -> Dream.html (Format.asprintf "%a" (Tyxml.Html.pp ()) tyxml_doc) 
    | None -> Dream.redirect req "/block"
  in
  Dream.get route handler


let get_valid_ids (m,bs) = 
  let redacted_ids_set = List.map (cata gene_collect_ids) bs |> List.fold_left StringSet.union StringSet.empty in
  StringSet.union (StringSet.of_list (block_list m)) redacted_ids_set
let print_ids (x,sid) = 
  let out = StringSet.fold (fun s acc -> s^", "^acc) sid "" in
  Dream.log "All collected IDs: %s" out;
  (x,sid)

let routes = 
  md_files "content"
  |> List.map md_to_doc
  |> fun docs -> (docs, List.fold_left StringSet.union StringSet.empty (List.map get_valid_ids docs))    
  |> print_ids 
  |> fun (docs,id_set) -> List.map (fun doc -> let (m,bs) = doc in (m,bs,id_set)) docs
  |> List.map (build_route)
  |> fun lst -> [Dream.get "/static/**" (Dream.static "static"); Dream.get "/block" (fun _ -> Dream.html "BLOCK")] @ lst 
  