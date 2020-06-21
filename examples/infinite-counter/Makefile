IMAGE = ondrejsika/infinite-counter

all: build push

build:
	docker build -t $(IMAGE) .

push:
	docker push $(IMAGE)
