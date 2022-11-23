build:
	docker build -t build-args .

build-2.7-slim:
	docker build -t build-args:2.7-slim --build-arg PYTHON_IMAGE_VERSION=2.7-slim .

build-3.10-slim:
	docker build -t build-args:3.10-slim --build-arg PYTHON_IMAGE_VERSION=3.10-slim .

run:
	docker run build-args

run-2.7-slim:
	docker run build-args:2.7-slim

run-3.10-slim:
	docker run build-args:3.10-slim
