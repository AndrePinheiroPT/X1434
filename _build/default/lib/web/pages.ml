open Dream
open Md
open Html_renderer

let home _ = 
  let md = In_channel.open_bin "content/index.md" in
  let ast = Markdown.parse md in
  let res = Html.render_doc ast in 

  Dream.html (Format.asprintf "%a" (Tyxml.Html.pp ()) (res |> Index.main))