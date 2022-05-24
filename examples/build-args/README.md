[sika.io](https://sika.io) | <ondrej@sika.io> | [go to course ->](https://github.com/ondrejsika/docker-training#course)

# [Docker Training](https://github.com/ondrejsika/docker-training) / Examples / Build Args

## Build with default arg

```
docker build -t build-args .
```

## Build with arguments

```
docker build -t build-args:2.7 --build-arg PYTHON_IMAGE_VERSION=2.7 .
docker build -t build-args:3.6 --build-arg PYTHON_IMAGE_VERSION=3.6 .
docker build -t build-args:3.9-slim --build-arg PYTHON_IMAGE_VERSION=3.9-slim .
```

## Run

```
docker run build-args
docker run build-args:2.7
docker run build-args:3.6
docker run build-args:3.9-slim
```
