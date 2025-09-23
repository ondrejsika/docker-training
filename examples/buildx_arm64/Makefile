default: build-and-load

all:
	make install-deps-debian
	make create-builder
	make build-and-load
	make build-and-push
	make run

install-deps-debian:
	apt-get install -y qemu qemu-user-static binfmt-support

create-builder:
	docker buildx create --name mybuilder --use

build-and-load:
	docker buildx build . --platform linux/arm64 -t ttl.sh/slu-arm64 --load

build-and-push:
	docker buildx build . --platform linux/arm64 -t ttl.sh/slu-arm64 --push

run:
	docker run --rm -it ttl.sh/slu-arm64
