build:
	docker run \
		-w /build \
		-v $(shell pwd):/build \
		gcr.io/kaniko-project/executor:debug \
		--context=/build \
		--destination=ttl.sh/kaniko-example \
		--cache=true \
		--cache-dir=/build/.kaniko-cache \
		--cache-repo=ttl.sh/cache/kaniko-example

run:
	docker run -p 8000:8000 ttl.sh/kaniko-example
