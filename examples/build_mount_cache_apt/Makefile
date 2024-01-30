IMAGE = build_mount_cache_apt

build:
	docker build . -t $(IMAGE) --build-arg PACKAGES="vim mc htop git"
	docker build . -t $(IMAGE)
