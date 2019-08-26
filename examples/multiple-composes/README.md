[sika.io](https://sika.io) | <ondrej@sika.io> | [go to course ->](https://github.com/ondrejsika/docker-training#course)

# [Docker Training](https://github.com/ondrejsika/docker-training) / Examples / Multiple Composes

# Run With Traefik

```
docker-compose -f docker-compose.yml -f docker-compose-traefik.yml up
```

Go <http://localhost> for web, <http://localhost:8080> for [Traefik](https://traefik.io) dashboard.

# Run With External Traefik

You have to run Traefik first. For example, see <https://github.com/ondrejsika/traefik-le>.

Then, run compose:

```
docker-compose -f docker-compose.yml -f docker-compose-traefik-external.yml up
```

Go <http://localhost> for web, <http://localhost:8080> for [Traefik](https://traefik.io) dashboard.

# Run With Port Forwading

```
docker-compose -f docker-compose.yml -f docker-compose-ports.yml up
```

Go <http://localhost> for web

Or specify port:

```
PORT=8000 docker-compose -f docker-compose.yml -f docker-compose-ports.yml up
```

Go <http://localhost:8000> for web

# Run tests

```
docker-compose -f docker-compose.yml -f docker-compose-test.yml up --abort-on-container-exit
```
