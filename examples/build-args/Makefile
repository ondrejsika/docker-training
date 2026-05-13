build:
	docker build . -t build-args
	docker build . -t build-args:2.7-slim \
		--build-arg PYTHON_IMAGE_VERSION=2.7-slim
	docker build . -t build-args:3.10-slim \
		--build-arg PYTHON_IMAGE_VERSION=3.10-slim
	docker build . -t build-args:3.14-alpine \
		--build-arg PYTHON_IMAGE_VERSION=3.14-alpine

run:
	docker run build-args
	docker run build-args:2.7-slim
	docker run build-args:3.10-slim
	docker run build-args:3.14-alpine
