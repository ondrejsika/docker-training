FROM debian:12
WORKDIR /app
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl ca-certificates && \
    rm -rf /var/lib/apt/lists/*
COPY install.sh .
RUN sh install.sh
CMD ["slu", "version", "--verbose"]
