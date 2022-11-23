up: up-traefik up-app

up-traefik:
	docker-compose -f traefik/docker-compose.yml up -d
	echo See Traefik dashboard: http://127.0.0.1:8080

up-app:
	docker-compose -f counter-example/docker-compose.yml up -d
	echo See application: http://127.0.0.1
