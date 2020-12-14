# Private Image for Private Pod

## Build

```
docker build -t registry.sikahq.com/pseudo-private/hello-world .
```

## Push

```
docker push registry.sikahq.com/pseudo-private/hello-world
```

## Run

```
docker run -p 80:80 registry.sikahq.com/pseudo-private/hello-world
```

Go <http://localhost>
