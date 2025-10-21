FROM golang:1.25 AS build
WORKDIR /build
COPY . .
RUN CGO_ENABLED=0 go build app.go

FROM debian:13-slim
WORKDIR /app
COPY --from=build /build/app .
CMD ["./app"]
EXPOSE 80
