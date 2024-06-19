
ifneq ($(shell which docker-compose 2>/dev/null),)
    DOCKER_COMPOSE := docker-compose
else
    DOCKER_COMPOSE := docker compose
endif

setup:
	@if [ ! -f .env ]; then \
		echo "no .env file found, copying default .env files"; \
		cp initial-setup-configs/.env.* .; \
	fi
	@if [ ! -d data/initial-setup-configs ]; then  \
		echo "no data folder found, copying default data folder..."; \
		cp -r initial-setup-configs/openedai-speech data/; \
	fi

install:
	$(DOCKER_COMPOSE) up -d

remove:
	@chmod +x confirm_remove.sh
	@./confirm_remove.sh

start run: setup
	./run-compose.sh --webui[port=3030] --enable-gpu --enable-api --ollama-data[folder=./data/ollama] --open-webui-data[folder=./data/open-webui]

down:
	@echo "Shutting down..."
	docker compose down --remove-orphans --volumes

logs: 
	$(DOCKER_COMPOSE) logs -f

startAndBuild: 
	$(DOCKER_COMPOSE) up -d --build

stop:
	$(DOCKER_COMPOSE) stop

clean: down
	$(DOCKER_COMPOSE) down --remove-orphans --volumes
	sudo rm -rf data/*

