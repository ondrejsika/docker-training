all: build run see

build:
	docker build -t health-check .

run:
	docker run -d --name health-check health-check

see:
	watch -n 0.3 docker ps -l
