FROM golang:1.25 AS build
WORKDIR /build
COPY . .
RUN \
  --mount=type=cache,target=/root/.cache/go-build \
  --mount=type=cache,target=/go \
  CGO_ENABLED=0 go build app.go

FROM debian:13-slim
WORKDIR /app
COPY --from=build /build/app .
CMD ["./app"]
EXPOSE 80
