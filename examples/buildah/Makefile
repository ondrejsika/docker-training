IMAGE := ttl.sh/hello-from-buildah

default: build-and-push

build-and-push:
	buildah bud -t ${IMAGE} .
	buildah push ${IMAGE}

run:
	docker run --rm ${IMAGE}

install:
	sudo apt-get update && apt-get install -y buildah

