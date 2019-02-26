# Run With Traefik

```
docker-compose -f docker-compose.yml -f docker-compose-traefik.yml up
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
