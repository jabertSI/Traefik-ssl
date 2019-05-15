.PHONY: help
.DEFAULT_GOAL= help

COM_COLOR   = \033[0;34m # blue
OBJ_COLOR   = \033[0;36m # cyan
OK_COLOR    = \033[0;32m # green
ERROR_COLOR = \033[0;31m # red
WARN_COLOR  = \033[0;33m # orange
NO_COLOR    = \033[m     # reset

help:
	@printf "${COM_COLOR}Usage:${NO_COLOR}\n"
	@printf " make [target]\n\n"
	@printf "${COM_COLOR}Available targets:${NO_COLOR}\n"
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "${OK_COLOR}%-10s${NO_COLOR} %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

.PHONY: run
run: ##Run Traefik reverse proxy
	docker-compose up

.PHONY: network
network:
	docker network create reverse_proxy

