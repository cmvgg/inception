all:
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker-compose -f ./srcs/docker-compose.yml down

re:
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

clean:
	@docker stop $$(docker ps -qa) || true;\
	docker rm $$(docker ps -qa) || true;\
	docker rmi -f $$(docker images -qa) || true;\
	docker volume rm $$(docker volume ls -q) || true;\
	docker network rm $$(docker network ls -q) || true;\
	docker system prune -f --volumes

.PHONY: all re down clean
