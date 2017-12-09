open Ocamlbuild_plugin;;
open Ocamlbuild_pack;;

dispatch begin
  function
  | After_rules ->

    rule ".proto -> .ml"
      ~prods:["%.ml"]
      ~deps:["%.proto"]
      (fun env build ->
         (Cmd (S[A"protoc";
                 A"--plugin=protoc-gen-custom=src/pb_plugin.native";
                 A"--custom_out"; A".";
                 A(env "%.proto")])))
  (* OCAMLRUNPARAM=b protoc --plugin=protoc-gen-custom=_build/src/protoc.native --custom_out test test/comprehensive.proto *)
  | _ -> ()
end;;


