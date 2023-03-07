all: up

build:
	docker-compose -f ./srcs/docker-compose.yml up -d --build

up:
	docker-compose -f ./srcs/docker-compose.yml up -d

down:
	docker-compose -f ./srcs/docker-compose.yml down

re: fclean all

clean: down
	docker system prune -a

fclean:
	docker system prune --all --force --volumes
	docker network prune --force
	docker volume prune --force

.PHONY	: all up build down re clean fclean