all: build run

build:
	docker build -t multistage-image .

run:
	docker run -p 80:80 multistage-image

build-kaniko:
	docker run \
		-w /build \
		-v $(shell pwd):/build \
		gcr.io/kaniko-project/executor:debug \
		--context=/build \
		--destination=ttl.sh/multistage-image-kaniko \
		--cache=true \
		--cache-dir=/build/.kaniko-cache \
		--cache-repo=ttl.sh/cache/multistage-image-kaniko

run-kaniko:
	docker pull ttl.sh/multistage-image-kaniko
	docker run -p 80:80 ttl.sh/multistage-image-kaniko
