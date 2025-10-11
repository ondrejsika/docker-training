FROM golang:1.24 AS builder
WORKDIR /build
COPY go.mod go.sum ./
RUN \
  --mount=type=cache,target=/go \
  go mod download
COPY . .
RUN \
  --mount=type=cache,target=/root/.cache/go-build \
  --mount=type=cache,target=/go \
  CGO_ENABLED=0 go build

FROM debian:13-slim
RUN \
  apt-get update && \
  apt-get install -y --no-install-recommends curl && \
  rm -rf /var/lib/apt/lists/*
COPY --from=builder /build/counter /usr/local/bin/counter
CMD [ "/usr/local/bin/counter" ]
EXPOSE 8000
