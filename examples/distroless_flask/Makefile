IMAGE = distroless_flask

run:
	docker build --platform linux/amd64 -t $(IMAGE) .
	docker image ls $(IMAGE)
	docker run -ti -p 80:80 $(IMAGE)
