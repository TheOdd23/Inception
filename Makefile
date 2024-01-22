all: build

build:
	mkdir -p /home/anhebert/data/mysql
	mkdir -p /home/anhebert/data/wordpress

	docker-compose -f ./srcs/docker-compose.yml up --build

up:
	docker-compose -f ./srcs/docker-compose.yml up 

down:
	docker-compose -f ./srcs/docker-compose.yml down

clean: down
	docker system prune --all --force --volumes
	docker network prune --force
	docker volume prune --force
	docker rmi -f $(docker images -a -q) || echo "docker images not removed"
	docker volume rm srcs_mdb --force
	docker volume rm srcs_wp --force
	sudo rm -rf /home/anhebert/data/mysql
	sudo rm -rf /home/anhebert/data/wordpress
	
re: clean all

.PHONY	: all up build down re clean