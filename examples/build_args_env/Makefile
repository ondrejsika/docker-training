test:
	docker build -t build_args_env_1 .
	docker build -t build_args_env_2 --build-arg FOO=Ahoj --build-arg BAR=Svete .

	docker run --rm build_args_env_1
	docker run --rm build_args_env_2

