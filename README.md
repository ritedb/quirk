# Quirk

A more concise performance evaluation for kvstore.

## Usage

bench 30000 times write and 5000 times random read with 4KB value:

```
cargo build --release
./quirk-bench.sh 4096 30000 5000
```

## Credit

It is a fork of [nervosnetwork/rust-kvstore-bench](https://github.com/nervosnetwork/rust-kvstore-bench) , but some adjustments and improvements have been made to the code .

## License

Licensed under either of:

- Apache License, Version 2.0 ([LICENSE-APACHE](./LICENSE-APACHE) or [http://apache.org/licenses/LICENSE-2.0](http://apache.org/licenses/LICENSE-2.0))
- MIT license ([LICENSE-MIT](./LICENSE-MIT) or [http://opensource.org/licenses/MIT](http://opensource.org/licenses/MIT))

