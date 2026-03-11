ARG BASE_IMAGE=debian:13-slim

FROM golang:1.26 AS build-dogsay
RUN go install github.com/sikalabs/dogsay@latest

FROM ${BASE_IMAGE}
COPY --from=build-dogsay /go/bin/dogsay /usr/local/bin/dogsay
CMD ["sh", "-c", ". /etc/os-release && dogsay \"Hello from $PRETTY_NAME!\""]
