FROM golang:1.26 AS vali-builder
RUN CGO_ENABLED=0 go install github.com/sikalabs/vali@master

FROM ghcr.io/sikalabs/hello-world-server
COPY --from=vali-builder /go/bin/vali /usr/local/bin/vali
COPY vali.yaml /
ENTRYPOINT ["vali", "entrypoint"]
CMD ["hello-world-server"]
