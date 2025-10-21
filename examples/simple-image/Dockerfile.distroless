FROM debian:12-slim AS build
WORKDIR /app
RUN apt-get update && \
    apt-get install -y --no-install-recommends python3 python3-venv
RUN python3 -m venv /app/venv
COPY requirements.txt .
RUN /app/venv/bin/pip3 install -r requirements.txt
COPY . .

FROM gcr.io/distroless/python3-debian12
WORKDIR /app
COPY --from=build /app /app
ENTRYPOINT ["/app/venv/bin/python"]
CMD ["app.py"]
EXPOSE 80
