open Tyxml.Html
open Md.Ast

module StringMap = Map.Make(String)
module StringSet = Set.Make(String)

let gene_html f_node =
  let lift x = Unsafe.coerce_elt x in
  
  match f_node with
  | Text s -> lift (txt s)
  | Break -> lift (br ())
  | HorLine -> lift (hr ())
  
  | Paragraph ns -> Unsafe.node "p" ns
  | Bold ns -> Unsafe.node "b" ns
  | Italic ns -> Unsafe.node "i" ns
  
  | Head (lvl, ns) ->
      let tag = match lvl with
        | 1 -> "h1" | 2 -> "h2" | 3 -> "h3"
        | 4 -> "h4" | 5 -> "h5" | _ -> "h6"
      in
      Unsafe.node tag ns

  | CodeLine s -> lift (code [txt s])
  | CodeBlock s -> lift (pre [code [txt s]])
  | LatexLine s -> lift (span ~a:[a_class ["math-inline"]] [txt s])
  | LatexBlock s -> lift (div ~a:[a_class ["math-block"]] [txt s])
  | Img (alt, src) -> lift (img ~src ~alt ())
  | Link (lbl, u) -> lift (a ~a:[a_href u] [txt lbl])

  | Redact _ -> lift (span [txt "???"])

let gene_reduce key f_node =
  match f_node with
  | Break  -> [In Break]
  | HorLine -> [In HorLine]

  | Text s -> [In (Text s)]
  | CodeLine s -> [In (CodeLine s)]
  | LatexLine s -> [In (LatexLine s)]
  | LatexBlock s -> [In (LatexBlock s)]
  | CodeBlock s -> [In (CodeBlock s)]
  | Img (a,s) -> [In (Img (a,s))]
  | Link (a,s) -> [In (Link (a,s))]

  | Italic nss -> [In (Italic (List.concat nss))]
  | Bold nss -> [In (Bold (List.concat nss))]
  | Paragraph nss -> [In (Paragraph (List.concat nss))]

  | Head (i,s) -> [In (Head (i,List.concat s))]
  | Redact (ls,s) -> (if List.mem key ls then [In (Text "[REDACTED]")] else List.concat s)

let gene_collect_ids f_node =
  match f_node with
  | Break | HorLine | Text _ | CodeLine _ | CodeBlock _ 
  | LatexLine _ | LatexBlock _ | Img _ | Link _ -> StringSet.empty

  | Italic nss | Bold nss | Paragraph nss | Head (_, nss) -> List.fold_left StringSet.union StringSet.empty nss

  | Redact (ls,nss) -> 
    let ids = StringSet.of_list ls in
    let child_ids = List.fold_left StringSet.union StringSet.empty nss in
    StringSet.union ids child_ids

let rec md_files dir = 
  Sys.readdir dir
  |> Array.to_list
  |> List.concat_map (fun name ->
    let path = Filename.concat dir name in
    if Sys.is_directory path then md_files path
    else if Filename.check_suffix path ".md" then [path]
    else []
  )