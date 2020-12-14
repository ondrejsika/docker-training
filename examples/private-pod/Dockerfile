FROM golang as build
WORKDIR /build
COPY app.go .
ENV CGO_ENABLED=0
RUN go build -a -ldflags \
    '-extldflags "-static"' app.go

FROM scratch
COPY --from=build /build/app .
CMD ["/app"]
EXPOSE 80