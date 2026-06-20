open Md

let kill x = ()

let () = 
  let res = (In_channel.open_bin "content/block.md") |> Markdown.parse in
  kill res;
