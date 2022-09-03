$(VERBOSE).SILENT:
.DEFAULT_GOAL = _default


## ———  Start/Down  ————————————————————————————————————————————————————————————
prepare: ## Preparation before the start. Create env files
	./create_env.sh

start: ## Running the application
	docker-compose up -d

start_debug: ## Running the application in debug mode
	docker-compose up

stop: ## Stop the application
	docker-compose down

## ———  IP conteiners  —————————————————————————————————————————————————————————
get_zookeeper_ip: ## Get IP address of kafka_zookeeper container
	docker container inspect kafka_zookeeper | \
    grep -Po '(?<="Gateway": ")[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*'

get_kafka_ip: ## Get IP address of kafka container
	docker container inspect kafka | \
    grep -Po '(?<="Gateway": ")[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*'

get_kafka_ui_ip: ## Get IP address of kafka_ui container
	docker container inspect kafka_ui | \
    grep -Po '(?<="Gateway": ")[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*'

# Listing all commands
help:
	grep -E '(^[a-z].*[^:]\s*##)|(^##)' $(MAKEFILE_LIST) | \
    perl -pe "s/Makefile://" | perl -pe "s/^##\s*//" | \
    awk ' \
        BEGIN { FS = ":.*##" } \
        $$2 { printf "\033[32m%-30s\033[0m %s\n", $$1, $$2 } \
        !$$2 { printf " \033[33m%-30s\033[0m\n", $$1 } \
    '

_default:
	make help;
