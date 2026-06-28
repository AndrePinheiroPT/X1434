open Utils
open Yojson.Basic.Util

let get_entry = 
  Yojson.Basic.from_file "content/nav.json"
  |> to_assoc
  |> List.fold_left (fun m (idx,s) -> StringMap.add idx (to_string s) m) StringMap.empty 
