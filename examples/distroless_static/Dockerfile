FROM golang:1.27 AS build
WORKDIR /build
COPY . .
RUN \
  --mount=type=cache,target=/root/.cache/go-build \
  CGO_ENABLED=0 go build

FROM gcr.io/distroless/static-debian13
COPY --from=build /build/checkip /usr/local/bin/checkip
CMD ["/usr/local/bin/checkip"]
