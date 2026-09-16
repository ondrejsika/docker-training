IMAGE := ttl.sh/multi-arch-go
PLATFORMS := linux/amd64,linux/arm64

default: build-and-push

build:
	docker buildx build . --platform ${PLATFORMS} -t ${IMAGE}

build-and-push:
	docker buildx build . --platform ${PLATFORMS} -t ${IMAGE} --push

run:
	docker run --rm ${IMAGE}

create-builder:
	docker buildx create --name mybuilder --driver docker-container --use
