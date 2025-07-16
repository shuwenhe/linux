.PHONY: run logs
dcm ?= docker-compose


# base service
run-depend:
	@echo ">> run"
	@$(dcm) -f deployments/nginx-mysql-redis.yaml up -d

status-depend:
	@echo ">> run"
	@$(dcm) -f deployments/nginx-mysql-redis.yaml ps

stop-depend:
	@echo ">> run"
	@$(dcm) -f deployments/nginx-mysql-redis.yaml  down


# shop
build:
	@echo ">> php build"
	@$(dcm) -f deployments/docker-compose.yaml build

stop:
	@echo ">> php stop"
	@$(dcm) -f deployments/docker-compose.yaml down

run:run-depend
	@echo ">> run"
	@$(dcm) -f deployments/docker-compose.yaml up -d

logs:
	@echo ">> cat logs"
	@$(dcm) -f deployments/docker-compose.yaml logs -f 

status:
	@echo ">> cat logs"
	@$(dcm) -f deployments/docker-compose.yaml logs ps