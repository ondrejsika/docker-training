FROM ghcr.io/sikalabs/hello-world-server
COPY --from=ghcr.io/sikalabs/vali:v0.2.0 /usr/local/bin/vali /usr/local/bin/vali
COPY vali.yaml /
ENTRYPOINT ["vali", "entrypoint"]
CMD ["hello-world-server"]
