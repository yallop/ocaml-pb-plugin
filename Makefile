all:
	ocaml pkg/pkg.ml build --tests true

clean:
	ocaml pkg/pkg.ml clean

boot: all
	mkdir -p _build/out
	OCAMLRUNPARAM=b protoc --plugin=protoc-gen-custom=_build/src/pb_plugin.native --custom_out=_build/out misc/messages_unnested.proto
	ocamlfind c -c -principal -package pb _build/out/misc/messages_unnested.ml
	cp _build/out/misc/messages_unnested.ml src/protoc_messages.ml
	$(MAKE) all

test: all
	@ echo "# Generating a Python module for messages in comprehensive.proto"
	@ mkdir -p _build/proto-python
	@ protoc --python_out=_build/proto-python test/comprehensive.proto

	@ echo "# Using the generated Python module to generate serialized messages:"
	@ echo "#    test/*.python.serialized"
	@ PYTHONPATH=_build/proto-python/test test/test_gen.py

	@ echo "# Running the OCaml tests:"
	@ echo "#   - checking that the generated code can read the python messages"
	@ echo "#   - using the generated code to generate serialized messages:"
	@ echo "#       test/*.ocaml.serialized"
	@ ocaml pkg/pkg.ml test

	@ echo "# Checking that Python can read the OCaml-generated messages"
	@ PYTHONPATH=_build/proto-python/test test/test_read.py
	@ echo OK

.PHONY: all clean test
