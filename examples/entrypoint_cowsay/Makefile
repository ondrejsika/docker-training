all:
	@make build
	@make run-1
	@make run-2

build:
	docker build -t entrypoint .

run-1:
	docker run entrypoint

run-2:
	docker run entrypoint Ahoj svete
