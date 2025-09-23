up:
	docker compose up -d --remove-orphans

up-build:
	docker compose up -d --build --remove-orphans

down:
	docker compose down --remove-orphans

down-with-volumes:
	docker compose down --remove-orphans --volumes

run-tests:
	docker compose run tests
	docker compose run ab-be-api
	docker compose run ab-be
	docker compose run ab-fe

.PHONY: tests
tests:
	COMPOSE_FILE=compose.yml:compose.tests.yml docker compose run tests

use-ports:
	echo "COMPOSE_FILE=compose.yml:compose.ports.yml" >> .env

use-tests:
	echo "COMPOSE_FILE=compose.yml:compose.tests.yml" >> .env

use-caddy:
	echo "COMPOSE_FILE=compose.yml:compose.scaled.yml:compose.caddy.yml" >> .env

use-traefik:
	echo "COMPOSE_FILE=compose.yml:compose.scaled.yml:compose.traefik.yml" >> .env
