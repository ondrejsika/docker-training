IMAGE := ttl.sh/multi-arch-native-merge

default:
	@echo "Please specify a target, e.g., build-amd64, build-arm64, push-amd64, push-arm64, merge, run"

# Run on an amd64 host
build-amd64:
	docker build . -t ${IMAGE}:amd64

# Run on an arm64 host
build-arm64:
	docker build . -t ${IMAGE}:arm64

push-amd64:
	docker push ${IMAGE}:amd64

push-arm64:
	docker push ${IMAGE}:arm64

# Run after both arch images are pushed, merges them into one multi-arch tag
merge:
	docker buildx imagetools create -t ${IMAGE}:latest ${IMAGE}:amd64 ${IMAGE}:arm64

run:
	docker run --rm ${IMAGE}:latest
