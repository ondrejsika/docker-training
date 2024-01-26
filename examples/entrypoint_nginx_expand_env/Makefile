run-dela:
	docker build --platform linux/amd64 -t entrypoint_nginx_expand_env .
	@echo See: http://127.0.0.1
	docker run -p 80:80 -e NAME=Dela entrypoint_nginx_expand_env

run-nela:
	docker build --platform linux/amd64 -t entrypoint_nginx_expand_env .
	@echo See: http://127.0.0.1
	docker run -p 80:80 -e NAME=Nela entrypoint_nginx_expand_env
