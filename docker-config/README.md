# Docker Config Example (Swarm Only)

At first, you have to enable swarm, if you havent enabled yet.

```
docker swarm init
```

Then, deploy this compose to swarm

```
docker stack deploy -c docker-compose.yml config
```

Go <http://localhost>

