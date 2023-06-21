MESSAGE = "Hello world"

all:
	@make build
	@make run

build:
	docker build -t entrypoint_nginx .

run:
	@echo See: http://127.0.0.1
	docker run -p 80:80 -e MESSAGE=${MESSAGE} entrypoint_nginx

run-fail:
	docker run -p 80:80 entrypoint_nginx
