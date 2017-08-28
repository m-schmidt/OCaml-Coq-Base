Require Import ExtrOcamlBasic.
Require Import ExtrOcamlString.
Require Import CoqMain.

Extraction Blacklist String.

(* map IO actions to OCaml functions using wrapper for signature convetsion *)
Extract Constant putStr => "CoqBinding.wrapStringToUnit print_endline".
Extract Constant getLine => "CoqBinding.wrapUnitToString read_line".

Cd "extraction".

Separate Extraction main.
