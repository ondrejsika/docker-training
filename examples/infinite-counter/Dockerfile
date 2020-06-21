FROM golang as build
WORKDIR /build
COPY counter.go .
ENV CGO_ENABLED=0
RUN go build -a -ldflags \
  '-extldflags "-static"' counter.go

FROM scratch
COPY --from=build /build/counter .
CMD ["/counter"]
