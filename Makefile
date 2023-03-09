all: up

up:
	sudo mkdir -p /home/ariahi/db
	sudo mkdir -p /home/ariahi/wp
	#sudo mkdir -p /var/lib/docker/volumes/srcs_DB/_data
	#sudo mkdir -p /var/lib/docker/volumes/srcs_wp/_data

	docker-compose -f ./srcs/docker-compose.yml up -d

down :
	docker-compose -f ./srcs/docker-compose.yml down

stop :
	docker-compose -f ./srcs/docker-compose.yml stop

start :
	docker-compose -f ./srcs/docker-compose.yml start

status :
	docker ps -a
