[sika.io](https://sika.io) | <ondrej@sika.io> | [go to course ->](https://github.com/ondrejsika/docker-training#course)

# [Docker Training](https://github.com/ondrejsika/docker-training) / Examples / Build Args

## Build with default arg

```
docker build -t reg.istry.cz/dte/build-args .
```

## Build with arguments

```
docker build -t reg.istry.cz/dte/build-args:2.7 --build-arg PYTHON_IMAGE_VERSION=2.7 .
docker build -t reg.istry.cz/dte/build-args:3.6 --build-arg PYTHON_IMAGE_VERSION=3.6 .
docker build -t reg.istry.cz/dte/build-args:3.6-slim --build-arg PYTHON_IMAGE_VERSION=3.6-slim .
```

## Run

```
docker run reg.istry.cz/dte/build-args
docker run reg.istry.cz/dte/build-args:2.7
docker run reg.istry.cz/dte/build-args:3.6
docker run reg.istry.cz/dte/build-args:3.6-slim
```
