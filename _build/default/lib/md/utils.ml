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
