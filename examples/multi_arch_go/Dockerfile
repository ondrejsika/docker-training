FROM --platform=$BUILDPLATFORM golang:1.27 AS build
WORKDIR /build
COPY . .
ARG TARGETOS
ARG TARGETARCH
RUN CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build

FROM scratch
COPY --from=build /build/hello-from-go /usr/local/bin/hello-from-go
CMD ["/usr/local/bin/hello-from-go"]
