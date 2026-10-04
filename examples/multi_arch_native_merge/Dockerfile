FROM golang:1.27 AS build
WORKDIR /build
COPY . .
RUN CGO_ENABLED=0 go build -o hello-from-go

FROM scratch
COPY --from=build /build/hello-from-go /usr/local/bin/hello-from-go
CMD ["/usr/local/bin/hello-from-go"]
