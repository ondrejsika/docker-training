test:
	docker build . -f Dockerfile.1 -t entrypoint_vs_cmd:1 -q
	docker build . -f Dockerfile.2 -t entrypoint_vs_cmd:2 -q
	docker build . -f Dockerfile.3 -t entrypoint_vs_cmd:3 -q

	docker run entrypoint_vs_cmd:1
	docker run entrypoint_vs_cmd:2
	docker run entrypoint_vs_cmd:3

	docker run entrypoint_vs_cmd:1 Ahoj Svete
	docker run entrypoint_vs_cmd:2 Ahoj Svete || true
	docker run entrypoint_vs_cmd:3 Ahoj Svete
