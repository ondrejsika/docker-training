build-run: build run

build:
	docker build -t ondrejsika/go-hello-world:3 .

push:
	docker push ondrejsika/go-hello-world:3

run:
	echo See http://127.0.0.1
	docker run -p 80:80 ondrejsika/go-hello-world:3
