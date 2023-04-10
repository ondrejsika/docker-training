IMAGE = ondrejsika/log-rotation

default: docker-build-and-push

docker-build-and-push:
	@make docker-build
	@make docker-push

docker-build:
	docker build --platform linux/amd64 -t $(IMAGE) .

docker-push:
	docker push $(IMAGE)
