[sika.io](https://sika.io) | <ondrej@sika.io> | [go to course ->](https://github.com/ondrejsika/docker-training#course)

# [Docker Training](https://github.com/ondrejsika/docker-training) / Examples / Health Check

## Build

```
docker build -t reg.istry.cz/dte/health-check .
```

## Run

```
docker run -d --name health-check reg.istry.cz/dte/health-check
```

## See

```
watch -n 0.3 docker ps -l
```
