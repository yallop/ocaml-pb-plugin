(lang dune 1.11)
(name pb-plugin)

(generate_opam_files true)

(implicit_transitive_deps false)

(license MIT)

(maintainers
  "Jeremy Yallop <yallop@gmail.com>"
  "Rudi Grinberg <me@rgrinberg.com>")
(authors "Jeremy Yallop <yallop@gmail.com>")
(source (github yallop/ocaml-pb-plugin))

(package
 (name pb-plugin)
 (depends
  ocaml
  pb
  (dune (>= 1.11))
  integers
  batteries
  result
  (angstrom (>= 0.10.0))
  faraday
  (ounit (and :with-test (>= 2.0))))
 (synopsis "Library for describing Protobuf messages")
 (description "Library for describing Protobuf messages"))
