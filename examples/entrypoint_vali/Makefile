TEXT = "Hello from Vali example!"
COLOR = "green"

all:
	@make build
	@make run

build:
	docker build -t entrypoint_vali .

run:
	@echo See: http://127.0.0.1:8000
	docker run -p 8000:8000 -e TEXT=${TEXT} -e COLOR=${COLOR} entrypoint_vali

run-fail:
	docker run -p 8000:8000 entrypoint_vali
