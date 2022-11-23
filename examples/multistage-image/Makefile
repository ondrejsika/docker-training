all: build run

build:
	docker build -t multistage-image .

run:
	docker run -p 80:80 multistage-image
