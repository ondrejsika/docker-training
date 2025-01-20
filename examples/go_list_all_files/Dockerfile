FROM golang:1.23 AS build
WORKDIR /build
COPY . .
RUN CGO_ENABLED=0 go build main.go

FROM scratch
WORKDIR /app
COPY --from=build /build/main .
CMD ["./main"]
