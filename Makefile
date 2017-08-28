OCB_FLAGS 	= -use-ocamlfind -I src -I extraction
OCB         = ocamlbuild $(OCB_FLAGS)

COQINCLUDES = -R src main.src
COQSOURCES  = src/CoqMain.v
COQC        = coqc $(COQINCLUDES) -q
COQEXEC     = coqtop $(COQINCLUDES) -batch -load-vernac-source

all: 		native

clean:
			$(OCB) -clean
			@rm -f ./src/*.glob ./src/*.vo
			@rm -f ./extraction/*.ml ./extraction/*.mli ./extraction/STAMP

native:		extraction
			$(OCB) Main.native

%.vo: %.v
			@echo "COQC $*.v"
			@$(COQC) $*.v

extraction: extraction/STAMP

extraction/STAMP: $(COQSOURCES:.v=.vo) extraction/extraction.v
			@rm -f extraction/*.ml extraction/*.mli
			@$(COQEXEC) extraction/extraction.v
			@touch extraction/STAMP

.PHONY: 	all clean extraction native
