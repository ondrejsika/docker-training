build:
	docker run \
		-w /build \
		-v $(shell pwd):/build \
		gcr.io/kaniko-project/executor:debug \
  	--context=/build \
		--destination=reg.istry.cz/kaniko-example \
		--cache=true \
		--cache-dir=/build/.kaniko-cache \
		--cache-repo=reg.istry.cz/cache/kaniko-example

run:
	docker run -p 8000:8000 reg.istry.cz/kaniko-example
