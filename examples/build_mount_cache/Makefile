build-1:
	docker build -f Dockerfile.1 .

build-2:
	docker build -f Dockerfile.2 .

build-2-kaniko:
	docker run \
		-w /build \
		-v $(shell pwd):/build \
		gcr.io/kaniko-project/executor:debug \
		--dockerfile=/build/Dockerfile.2 \
		--context=/build \
		--destination=ttl.sh/build-mount-cache-example \
		--cache=true \
		--cache-dir=/build/.kaniko-cache \
		--cache-repo=ttl.sh/cache/build-mount-cache-example

run-2-kaniko:
	docker pull ttl.sh/build-mount-cache-example
	docker run ttl.sh/build-mount-cache-example large
