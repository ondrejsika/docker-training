FROM golang:1.23 AS build
WORKDIR /build
COPY counter.go .
ENV CGO_ENABLED=0
RUN go build counter.go

FROM scratch
COPY --from=build /build/counter .
CMD ["/counter"]
