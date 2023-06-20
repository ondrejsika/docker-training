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
		--destination=reg.istry.cz/multistage-image-kaniko \
		--cache=true \
		--cache-dir=/build/.kaniko-cache \
		--cache-repo=reg.istry.cz/cache/multistage-image-kaniko

run-kaniko:
	docker pull reg.istry.cz/multistage-image-kaniko
	docker run -p 80:80 reg.istry.cz/multistage-image-kaniko
