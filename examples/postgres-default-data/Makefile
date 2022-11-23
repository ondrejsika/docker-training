all:
	@make build
	@make run
	sleep 3
	@make validate

build:
	docker build -t postgres-default-data .

run:
	docker run --name pg -d -e POSTGRES_PASSWORD=pg postgres-default-data

validate:
	docker exec -u postgres pg psql -c "select * from hello;"
