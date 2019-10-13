# rbp1-cross-docker

Docker image for use with https://github.com/rust-embedded/cross/ Rust cross compilation tool to target Raspberry PI1/Zero/Zero W.

In your Cross.toml file, add:

```toml
[target.arm-unknown-linux-gnueabihf]
image = "zenria/cross:arm-rpi-4.9.3-linux-gnueabihf"
If you need to link against openssl, please use the vendored version of it.
```

