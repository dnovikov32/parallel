ENV = source ./.docker/env.sh
DOCKER_COMPOSE = $(ENV) && docker-compose

SHELL := /bin/bash
DEFAULT_GOAL := help

help:
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-27s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

.PHONY: start
start: ## Start all docker containers. To start only one container, use CONTAINER=<service>
	$(DOCKER_COMPOSE) up $(CONTAINER)

.PHONY: -build
build: ## Build all docker images. Build a specific image: make docker-build CONTAINER=<service>
	$(DOCKER_COMPOSE) up --force-recreate --no-deps --build
