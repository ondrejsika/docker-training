[sika.io](https://sika.io) | <ondrej@sika.io> | [go to course ->](https://github.com/ondrejsika/docker-training#course)

# [Docker Training](https://github.com/ondrejsika/docker-training) / Examples / Postgres With Default Data

## Build with default arg

```
docker build -t reg.istry.cz/dte/postgres-default-data .
```

## Run

```
docker run --name pg -d -e POSTGRES_PASSWORD=pg reg.istry.cz/dte/postgres-default-data
```

## Validate

```
docker exec -u postgres pg psql -c "select * from hello;"
```
