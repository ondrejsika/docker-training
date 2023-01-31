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
		--destination=reg.istry.cz/build-mount-cache-example \
		--cache=true \
		--cache-dir=/build/.kaniko-cache \
		--cache-repo=reg.istry.cz/cache/build-mount-cache-example

run-2-kaniko:
	docker run reg.istry.cz/build-mount-cache-example large
