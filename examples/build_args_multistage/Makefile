test:
	docker build . -t build-args-multistage-debian \
		--build-arg BASE_IMAGE=debian:13-slim
	docker build . -t build-args-multistage-ubuntu \
		--build-arg BASE_IMAGE=ubuntu:24.04
	docker run --rm build-args-multistage-debian
	docker run --rm build-args-multistage-ubuntu
