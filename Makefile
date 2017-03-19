LIB_NAME=pbrt-yojson
OCAMLFIND_PKG_NAME=ocaml-protoc-yojson
LIB_FILES+=pbrt_yojson
LIB_DIR=src
LIB_DEPS=ocaml-protoc,yojson

test: gen 
	$(OCB) unit_tests.native
	export OCAMLRUNPARAM="b" && ./unit_tests.native 
	$(OCB) message_test.native
	export OCAMLRUNPARAM="b" && ./message_test.native 

gen:
	ocaml-protoc -json -ml_out tests tests/pet.proto
	ocaml-protoc -json -ml_out tests -I tests tests/message.proto

doc-gen:
	$(OCB) $(LIB_DIR)/$(LIB_NAME).docdir/index.html

## Generic library makefile ## 
include Makefile.opamlib

