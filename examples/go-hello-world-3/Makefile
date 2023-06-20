IMAGE = reg.istry.cz/ondrejsika/go-hello-world:3

build-run: build run
build-push: build push

build:
	docker build -t $(IMAGE) .

push:
	docker push $(IMAGE)

run:
	echo See http://127.0.0.1
	docker run -p 80:80 $(IMAGE)
