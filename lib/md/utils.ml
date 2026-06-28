module StringMap = Map.Make(String)
module StringSet = Set.Make(String)

module type Monad = sig
  type 'a t
  val return : 'a -> 'a t
  val (>>=): 'a t -> ('a -> 'b t) -> 'b t
end

module Option : Monad with type 'a t = 'a option = struct
  type 'a t = 'a option

  let return x = Some x

  let ( >>= ) m f =
    match m with
    | Some ctx -> f ctx
    | None -> None
end

let t2 f g x = (f x, g x ) 

let id x = x

let rem_suf suf s =
  if String.ends_with ~suffix:suf s then String.sub s 0 (String.length s - String.length suf)
  else s