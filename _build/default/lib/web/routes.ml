open Html_renderer.Html
open Html_renderer
open Md.Utils
open Md.Utils.Option
open Md
open Ast

let md_to_doc file_path = (In_channel.open_bin file_path) |> Markdown.parse 

let hmac key msg =
  let hash = Cryptokit.MAC.hmac_sha256 key in
  let raw = Cryptokit.hash_string hash msg in
  Cryptokit.transform_string (Cryptokit.Hexa.encode ()) raw

let sign msg =
  let key = Sys.getenv "SECRET_KEY" in
  hmac key msg

let verify (id,asg) = if sign id = asg then Some (id,asg) else None 

let product ma mb = 
  ma >>= fun a -> 
  mb >>= fun b -> 
  return (a, b)

let block blocked_list (id,asg) = if List.mem id blocked_list then None else Some (id,asg)

let valid ids_set (id,asg) = if StringSet.mem id ids_set then Some (id,asg) else None

let block_list m = match StringMap.find_opt "block" m with | Some v -> String.split_on_char ',' v | None -> []

let docs =
  md_files "content"
  |> List.map md_to_doc

let valid_ids =
  docs 
  |> List.map (fun (m,n,b) -> 
    let ids_from_nodes = b |> List.map (cata gene_collect_ids) |> List.fold_left StringSet.union StringSet.empty  in
    let ids_from_field = m |> block_list |> StringSet.of_list in 
    StringSet.union ids_from_nodes ids_from_field
  )
  |> List.fold_left StringSet.union StringSet.empty 

let block_assets_map =
  docs
  |> List.concat_map (fun (m,n,b) -> b |> List.concat_map (cata gene_collect_static_url) |> List.map (fun (l, url) -> ((block_list m) @ l ,url)))
  |> List.fold_left (fun m (l,p) -> 
    List.fold_left (fun mm id -> StringMap.update p (function | Some k -> Some (StringSet.add id k) | None -> Some (StringSet.singleton id)) mm) m l
  ) StringMap.empty

let build_route (m,nav,bs)  = 
  let route = match StringMap.find_opt "route" m with | Some v -> v | None -> "/" in
  let handler = fun req -> 
    let id = Dream.query req "id" in
    let asg = Dream.query req "asg" in
   
    let binding_pipe = 
      product id asg
      >>= verify
      >>= (valid valid_ids)
      >>= (block (block_list m))
      >>= (fun (valid_id,valid_asg) ->
        let pid = "?id="^valid_id^"&asg="^valid_asg in
        let reduced_nodes = List.concat_map (cata (gene_reduce valid_id)) bs in  
        let final_tree = List.concat_map (cata (gene_append_id pid)) reduced_nodes in
        let filtered_nav = nav |> List.filter (fun (l,_,_) -> not (List.mem valid_id l) ) |> List.map (fun (a,b,u) -> (a,b,u^pid)) |> nav_tyxml in
        let content = List.map (cata gene_html) final_tree in
          return (Index.main m filtered_nav content)
        )
    in
    match binding_pipe with 
    | Some tyxml_doc -> Dream.html (Format.asprintf "%a" (Tyxml.Html.pp ()) tyxml_doc) 
    | None -> Dream.empty `Forbidden
  in
  Dream.get route handler


let get_valid_ids (m,nav,bs) = 
  let nav_ids_set = nav |> List.map (fun (l,_,_) -> StringSet.of_list l) |> List.fold_left StringSet.union StringSet.empty in 
  let redacted_ids_set = List.map (cata gene_collect_ids) bs |> List.fold_left StringSet.union StringSet.empty in
  (StringSet.of_list (block_list m)) 
  |> StringSet.union nav_ids_set
  |> StringSet.union redacted_ids_set

let print_ids = 
  let out = StringSet.fold (fun s acc -> 
    Dream.log "Link -> ?id=%s&asg=%s" s (sign s); 
    s^", "^acc
    ) valid_ids "" in
  Dream.log "All ids collected: %s" out

let is_safe path = not (String.contains path '/' || path = "..")

let log_stringset_map m =
  StringMap.iter
    (fun key set ->
      let elems =
        StringSet.fold
          (fun x acc -> x :: acc)
          set
          []
        |> String.concat ", "
      in
      Dream.log "key=%s -> {%s}" key elems
    )
    m

let give_asset req =
  let target = Dream.target req in

  let path_no_query =
    match String.index_opt target '?' with
    | None -> target
    | Some i -> String.sub target 0 i
  in

  let prefix = "/static/asset/" in
  let relative_path =
    if String.starts_with ~prefix path_no_query then
      let start = String.length prefix in
      String.sub path_no_query start (String.length path_no_query - start)
    else
      path_no_query
  in

  Dream.log "Requested relative path: %s" relative_path;

  let id = Dream.query req "id" in
  let asg = Dream.query req "asg" in

  let check_permissions (user_id,_) =
    match StringMap.find_opt relative_path block_assets_map with
    | Some blocked_ids -> 
      Dream.log "%s" user_id;
      if StringSet.mem user_id blocked_ids then (
      Dream.log "Access Denied: User %s is blocked from %s" user_id relative_path;
      None
      ) else Some ()
    | None -> Some () 
  in

  let pipe =
    product id asg
    >>= verify
    >>= (valid valid_ids)
    >>= check_permissions
  in

  match pipe with
  | Some () -> Dream.from_filesystem "static/asset" relative_path req
  | _ -> Dream.empty `Forbidden


let routes = 
  log_stringset_map block_assets_map;
  docs
  |> List.map (fun (m, nav, bs) -> build_route (m, nav, bs))
  |> fun rs -> rs @ [
    Dream.get "/static/asset/**" give_asset;
    Dream.get "/static/**" (Dream.static "static/main");
  ]