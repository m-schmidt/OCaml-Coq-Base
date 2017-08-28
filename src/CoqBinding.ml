open Datatypes


(* Convert a Coq string into an OCaml string *)
let toCaml (s : char list) : string =
  let r = Bytes.create (List.length s) in
  let rec fill pos = function
  | []    -> r
  | c::cs -> Bytes.set r pos c; fill (pos + 1) cs
  in Bytes.to_string (fill 0 s)

(* Convert an OCaml string into a Coq string *)
let toCoq (s : string) : char list =
  let rec cstring accu pos =
    if pos < 0 then accu else cstring (s.[pos] :: accu) (pos - 1)
  in cstring [] (String.length s - 1)


(* Wrappers that map for OCaml functions signatures to Coq types *)
let wrapStringToUnit (f : string -> unit) (s : char list) : unit =
    f (toCaml s)

let wrapUnitToString (f : unit -> string) () : char list =
    toCoq (f ())
