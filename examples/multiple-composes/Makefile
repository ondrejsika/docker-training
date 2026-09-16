up:
	docker compose up -d --remove-orphans

down:
	docker compose down --remove-orphans

run-test:
	docker compose run test
	docker compose run ab

use-ports:
	echo 'COMPOSE_FILE=compose.yml:compose.ports.yml' >> .env

use-test:
	echo 'COMPOSE_FILE=compose.yml:compose.test.yml' >> .env

use-traefik-internal:
	echo 'COMPOSE_FILE=compose.yml:compose.replicas.yml:compose.traefik-internal.yml' >> .env

use-traefik-external:
	echo 'COMPOSE_FILE=compose.yml:compose.replicas.yml:compose.traefik-external.yml' >> .env
