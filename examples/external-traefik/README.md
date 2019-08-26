# Run Traefik Loadbalancer

```
docker-compose -f traefik/docker-compose.yml up -d
```

# Run Counter application

```
docker-compose -f counter-example/docker-compose.yml up -d
```

See application on <http://127.0.0.1> and Traefik dashboard on <http://127.0.0.1:8080>