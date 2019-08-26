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
