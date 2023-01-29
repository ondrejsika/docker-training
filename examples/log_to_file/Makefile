IMAGE = log_to_file

run-docker:
	docker build --platform linux/amd64 -t $(IMAGE) .
	docker run -ti $(IMAGE)

run-local:
	python3 log_to_file.py

link-stdout:
	rm -rf out.log
	ln -s /dev/stdout out.log
