all:
	@make build
	@make run-1
	@make run-2

build:
	docker build -t cowsay .
	docker build -t cowsay1 -f Dockerfile.1 .
	docker build -t cowsay2 -f Dockerfile.2 .

run-1:
	docker run cowsay

run-2:
	docker run cowsay Ahoj svete
