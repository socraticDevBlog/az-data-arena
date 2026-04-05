SHELL := /bin/bash

.PHONY: help up down restart logs ps exec psql rebuild secret

SECRET_DIR := .secrets
SECRET_FILE := $(SECRET_DIR)/postgres_password

help:
	@echo "Makefile targets:"
	@echo "  up         - create secret (if missing) and docker compose up -d"
	@echo "  down       - docker compose down"
	@echo "  restart    - docker compose restart"
	@echo "  logs       - follow postgres logs"
	@echo "  ps         - show docker compose ps"
	@echo "  exec       - open a shell in the postgres container (sh)"
	@echo "  psql       - open psql as user 'app' against the service"
	@echo "  rebuild    - rebuild images and recreate containers"
	@echo "  secret     - interactively create the local secret file"

## Ensure secret exists locally (creates interactively if missing)
secret:
	@mkdir -p $(SECRET_DIR)
	@if [ -f $(SECRET_FILE) ]; then \
		echo "Secret exists: $(SECRET_FILE)"; \
		exit 0; \
	fi
	@read -s -p "Enter POSTGRES password: " PWD; echo; \
	echo "$$PWD" > $(SECRET_FILE); chmod 600 $(SECRET_FILE); \
	echo "Created $(SECRET_FILE)"

up: 
	@docker compose up -d
down:
	@docker compose down

restart:
	@docker compose restart

logs:
	@docker compose logs -f postgres

ps:
	@docker compose ps

exec:
	@docker compose exec postgres sh

psql:
	@docker compose exec -T postgres psql -U app -d dataplatform

rebuild: secret
	@docker compose up -d --build --force-recreate
