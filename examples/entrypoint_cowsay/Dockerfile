FROM debian:11-slim
RUN apt-get update && apt-get install -y --no-install-recommends \
    cowsay \
    && rm -rf /var/lib/apt/lists/*
ENTRYPOINT ["/usr/games/cowsay"]
CMD ["Hello World"]
