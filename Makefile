all: up

up:
		sudo systemctl restart docker 
		sudo docker-compose -f srcs/docker-compose.yml build --no-cache
		sudo docker-compose -f srcs/docker-compose.yml up #--force-recreate #-d --force-recreate


down:
		sudo docker-compose -f srcs/docker-compose.yml down -v

ps:		
		sudo docker-compose -f srcs/docker-compose.yml ps -a
		sudo docker ps -a

clean:	down
		sudo rm -rf /home/${USER}/data/db
		sudo rm -rf /home/${USER}/data/wwebsite
		sudo docker system prune
		mkdir -p /home/${USER}/data/db
		mkdir -p /home/${USER}/data/website

re : 	clean up

mariadb:
		sudo docker exec -it mariadb bash
nginx:
		sudo docker exec -it nginx bash

wordpress:
		sudo docker exec -it wordpress bash


.PHONY: start stop re ps clean