FROM golang:1.19 as build
WORKDIR /build
COPY app.go .
ENV CGO_ENABLED=0
RUN go build app.go

FROM scratch
WORKDIR /app
COPY --from=build /build/app .
CMD ["./app"]
EXPOSE 80
