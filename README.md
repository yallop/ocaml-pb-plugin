## pb-plugin

A [`protoc`][protoc] plugin that turns `.proto` files into OCaml protobuf serialization functions built with the [`pb`][pb] library.

### Use

```
protoc --plugin=protoc-gen-custom=$(type -p pb-plugin) --custom_out=./build file.proto
```

### Implementation notes

The interface between `protoc` and plugins is defined as a [set of protobuf messages][plugin-messages] that describe the contents of a `.proto` file.

The `pb-plugin` plugin is bootstrapped.  The file [`src/protoc_messages.ml`](src/protoc_messages.ml) that reads and writes messages passed between `protoc` and the `plugin` is generated from the file [`misc/messages_unnested.proto`](misc/messages_unnested.proto) using `pb-plugin` itself

***

[![Travis build Status](https://travis-ci.org/yallop/ocaml-pb-plugin.svg?branch=master)](https://travis-ci.org/yallop/ocaml-pb-plugin) 

[protoc]: https://developers.google.com/protocol-buffers/docs/proto#generating
[pb]: http://github.com/yallop/ocaml-pb
[plugin-messages]: misc/messages.proto
