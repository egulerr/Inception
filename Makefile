build:
	cd srcs && docker-compose build

run:
	cd srcs && docker-compose up

down:
	cd srcs && docker-compose down -v

stop:
	cd srcs && docker-compose stop

mariadb:
	docker exec -it mariadb sh

mysql:
	docker exec -it mariadb mysql -u root -p

mysql-eguler:
	docker exec -it mariadb mysql -u eguler -p wordpress

nginx:
	docker exec -it nginx sh

wordpress:
	docker exec -it wordpress sh

remove-images:
	cd srcs && docker-compose down --rmi all

remove-network:
	cd srcs && docker-compose down --remove-orphans

remove-cache:
	sudo rm -rf ./../data/mysql/*
	sudo rm -rf ./../data/wordpress/*

re: remove-images remove-network build run

.PHONY:	re remove-network remove-images wordpress nginx mysql mysql-eguler mariadb stop down run build