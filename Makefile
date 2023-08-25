dstart:
	@echo "docker start"
	@docker-compose up -d

dstop:
	@echo "docker stop"
	@docker-compose stop

# restart container
drestart:
	@make dstop
	@make dstart

dstatus:
	@echo "docker status"
	@docker ps --filter name=$(CONTAINER_PREFIX)

dlogin:
	@echo "docker login"
	@docker exec -it $(shell docker ps --all --format "{{.Names}}" | peco) /bin/sh

dclean:
	@echo "docker clean"
	@docker-compose down

dlog:
	@echo "docker log"
	@docker-compose logs -f $(shell docker ps --all --format "{{.Names}}" | peco | cut -d"_" -f2)