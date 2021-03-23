SHELL=bash

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

default: help

local-setup-db: ## Run everything with docker compose
	# remove the old containers, if any
	docker-compose --file docker-compose-db.yml down
	# build and run the containers
	docker-compose --file docker-compose-db.yml up --build -d
	# see whats up
	docker ps -a
	# check the schema and data loaded ok
	docker logs my-postgres-setup 
	# wait for postgres a bit extra
	./db-scripts/wait-for-postgres.sh localhost 5432
	# exercise the api
	./db-scripts/call-express-app.sh 

local-setup-pokemon: ## Run just the pokemon app with docker compose
	# remove the old containers, if any
	docker-compose --file docker-compose-pokemon.yml down
	# build and run the containers
	docker-compose --file docker-compose-pokemon.yml up --build -d pokemon-app
	#wait for app
	./pokemon-app/wait-for-app.sh localhost 3001
	# exercise the api
	curl -X GET localhost:3001
