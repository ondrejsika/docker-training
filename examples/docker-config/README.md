[sika.io](https://sika.io) | <ondrej@sika.io> | [go to course ->](https://github.com/ondrejsika/docker-training#course)

# [Docker Training](https://github.com/ondrejsika/docker-training) / Examples / Docker Config Example (Swarm Only)

At first, you have to enable swarm, if you havent enabled yet.

```
docker swarm init
```

Then, deploy this compose to swarm

```
docker stack deploy -c docker-compose.yml config
```

Go <http://localhost>
