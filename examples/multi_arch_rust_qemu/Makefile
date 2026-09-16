IMAGE := ttl.sh/multi-arch-rust
PLATFORMS := linux/amd64,linux/arm64

default: build-and-push

build:
	docker buildx build . --platform ${PLATFORMS} -t ${IMAGE}

build-and-push:
	docker buildx build . --platform ${PLATFORMS} -t ${IMAGE} --push

run:
	docker run --rm ${IMAGE}

install-deps-debian:
	apt-get install -y qemu-user-static binfmt-support

create-builder:
	docker buildx create --name mybuilder --driver docker-container --use
