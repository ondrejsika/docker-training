[sika.io](https://sika.io) | <ondrej@sika.io> | [go to course ->](https://github.com/ondrejsika/docker-training#course)

# [Docker Training](https://github.com/ondrejsika/docker-training) / Examples / External Traefik

## Run Traefik Loadbalancer

```
docker-compose -f traefik/docker-compose.yml up -d
```

## Run Counter application

```
docker-compose -f counter-example/docker-compose.yml up -d
```

See application on <http://127.0.0.1> and Traefik dashboard on <http://127.0.0.1:8080>
