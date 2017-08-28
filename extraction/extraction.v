Require Import ExtrOcamlBasic.
Require Import ExtrOcamlString.
Require Import CoqMain.

Extraction Blacklist String.

Extract Constant putStr => "CoqBinding.wrapStringToUnit print_endline".
Extract Constant getLine => "CoqBinding.wrapUnitToString read_line".

Cd "extraction".

Separate Extraction main.
