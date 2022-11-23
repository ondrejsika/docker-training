FROM golang:1.19 as build
WORKDIR /build
COPY counter.go .
ENV CGO_ENABLED=0
RUN go build counter.go

FROM scratch
COPY --from=build /build/counter .
CMD ["/counter"]
