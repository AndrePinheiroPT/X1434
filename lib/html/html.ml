open Tyxml.Html
open Md.Ast
open Md.Utils

let lift x = Unsafe.coerce_elt x

let gene_html f_node =
  match f_node with
  | Text s -> lift (txt s)
  | Break -> lift (br ())
  | HorLine -> lift (hr ())
  
  | Paragraph ns -> Unsafe.node "p" ns
  | Bold ns -> Unsafe.node "b" ns
  | Italic ns -> Unsafe.node "i" ns
  | BulletList ns -> lift (ul (List.map li ns))
  | QuoteBlock ns -> lift (blockquote (List.map (Unsafe.node "p") ns))
  | Head (lvl, ns) ->
      let tag = match lvl with
        | 1 -> "h1" | 2 -> "h2" | 3 -> "h3"
        | 4 -> "h4" | 5 -> "h5" | _ -> "h6"
      in
      Unsafe.node tag ns

  | CodeLine s -> lift (code [txt s])
  | CodeBlock s -> lift (pre [code [txt s]])
  | LatexLine s -> lift (txt ("\\("^s^"\\)"))
  | LatexBlock s -> lift (txt ("$$"^s^"$$"))
  | Img (alt, src) -> lift (div [img ~src ~alt ~a:[a_class ["img_main"]] (); span ~a:[a_class ["img_label"]] [txt alt]])
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
  | BulletList nss -> [In (BulletList (List.map List.concat nss))]
  | QuoteBlock nss -> [In (QuoteBlock (List.map List.concat nss))]

  | Head (i,s) -> [In (Head (i,List.concat s))]
  | Redact (ls,s) -> (if List.mem key ls then [In (Text "[REDACTED]")] else List.concat s)

let gene_collect_ids f_node =
  match f_node with
  | Break | HorLine | Text _ | CodeLine _ | CodeBlock _ 
  | LatexLine _ | LatexBlock _ | Img _ | Link _ -> StringSet.empty

  | Italic nss | Bold nss | Paragraph nss | Head (_, nss) -> List.fold_left StringSet.union StringSet.empty nss
  | QuoteBlock nss | BulletList nss -> nss |> List.concat |> (List.fold_left StringSet.union StringSet.empty) 

  | Redact (ls,nss) -> 
    let ids = StringSet.of_list ls in
    let child_ids = List.fold_left StringSet.union StringSet.empty nss in
    StringSet.union ids child_ids

let gene_collect_static_url f_node =
  let prefix = "/static/asset/" in
  let normalize url = 
    if String.starts_with ~prefix url then
      let s = String.length prefix in
      Some (String.sub url s (String.length url - s))
    else None
  in

  match f_node with
  | Break | HorLine | Text _ | CodeLine _ | CodeBlock _ | LatexLine _ | LatexBlock _ -> []

  | Img (_, url) | Link (_, url) -> 
    (match normalize url with
    | Some path -> [([],path)]
    | None -> [] 
    )

  | Redact (allowed_ids, nss) -> (nss |> List.concat |> List.map (fun (l, url) -> (allowed_ids @ l ,url)) )
  | Italic nss | Bold nss | Paragraph nss | Head (_, nss) -> List.concat nss
  | QuoteBlock nss | BulletList nss -> nss |> List.map List.concat |> List.concat

let gene_append_id pid f_node =
  match f_node with
  | Break  -> [In Break]
  | HorLine -> [In HorLine]

  | Text s -> [In (Text s)]
  | CodeLine s -> [In (CodeLine s)]
  | LatexLine s -> [In (LatexLine s)]
  | LatexBlock s -> [In (LatexBlock s)]
  | CodeBlock s -> [In (CodeBlock s)]
  | Img (a,s) -> [In (Img (a,s^pid))]
  | Link (a,s) -> [In (Link (a,s^pid))]

  | Italic nss -> [In (Italic (List.concat nss))]
  | Bold nss -> [In (Bold (List.concat nss))]
  | Paragraph nss -> [In (Paragraph (List.concat nss))]
  | BulletList nss -> [In (BulletList (List.map List.concat nss))]
  | QuoteBlock nss -> [In (QuoteBlock (List.map List.concat nss))]

  | Head (i,s) -> [In (Head (i,List.concat s))]
  | Redact (ls,s) -> [In (Redact(ls, List.concat s))]


let rec md_files dir = 
  Sys.readdir dir
  |> Array.to_list
  |> List.concat_map (fun name ->
    let path = Filename.concat dir name in
    if Sys.is_directory path then md_files path
    else if Filename.check_suffix path ".md" then [path]
    else []
  )

let nav_tyxml nav = List.map (fun (_,alt,url) -> 
  lift (a ~a:[a_href url; a_class ["header__nav__sublink"]] [txt alt])) nav
  