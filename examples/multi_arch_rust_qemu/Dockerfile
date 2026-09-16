FROM rust:1-slim-trixie AS build
WORKDIR /build
COPY . .
RUN cargo build --release

FROM debian:13-slim
COPY --from=build /build/target/release/hello-from-rust /usr/local/bin/hello-from-rust
CMD ["hello-from-rust"]
