FROM docker.io/library/golang:1.27 AS build
WORKDIR /build
COPY . .
RUN CGO_ENABLED=0 go build

FROM scratch
COPY --from=build /build/hello-from-buildah /usr/local/bin/hello-from-buildah
CMD ["/usr/local/bin/hello-from-buildah"]
