FROM golang:1.23 as build
WORKDIR /build
COPY . .
RUN CGO_ENABLED=0 go build app.go

FROM debian:12-slim
WORKDIR /app
COPY --from=build /build/app .
CMD ["./app"]
EXPOSE 80
