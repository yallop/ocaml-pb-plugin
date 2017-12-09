#!/usr/bin/env ocaml
#use "topfind"
#require "topkg"
open Topkg

let () =
  Pkg.describe "pb-plugin"
    ~licenses:[Pkg.std_file "LICENSE"]
  @@ fun c ->
    Ok [ Pkg.bin "src/pb_plugin";
         Pkg.doc "README.md";
         Pkg.test ~dir:"test" "test/test"; ]
