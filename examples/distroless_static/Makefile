IMAGE = checkip

all: build run

build:
	docker build -t ${IMAGE} .
	docker build -t ${IMAGE}:scratch -f Dockerfile.scratch .

run:
	docker run --rm ${IMAGE}
	docker run --rm ${IMAGE}:scratch
