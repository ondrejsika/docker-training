IMAGE = distroless_python

run:
	docker build --platform linux/amd64 -t $(IMAGE) .
	docker run $(IMAGE)
	docker image ls $(IMAGE)
