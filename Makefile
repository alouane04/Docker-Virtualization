all: up

up:
	sudo mkdir -p /home/ariahi/db
	sudo mkdir -p /home/ariahi/wp

	docker-compose -f ./srcs/docker-compose.yml up --build -d

down :
	docker-compose -f ./srcs/docker-compose.yml down

stop :
	docker-compose -f ./srcs/docker-compose.yml stop

start :
	docker-compose -f ./srcs/docker-compose.yml start

status :
	docker ps -a
