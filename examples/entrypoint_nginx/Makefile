MESSAGE = "Hello world"

all:
	@make build
	@make run

build:
	docker build -t entrypoint_nginx .

run:
	docker run -p 80:80 -e MESSAGE=${MESSAGE} entrypoint_nginx

run-fail:
	docker run -p 80:80 entrypoint_nginx
