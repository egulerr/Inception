# inception
This project aims to deepen the knowledge of system administration.

Use of <strong>dockerfile</strong> for the creation and management of custom images, micro services.

Use of <strong>docker-compose</strong> for the deployment of containers, the creation and management of the network, storage space, etc ...

## How to run

- run `make` or `make run` to start the docker-compose containers.
- run `make stop` to stop the containers.
- run `make down` to stop the containers and/or delete the volumes.

NOTE: to change the docker-compose volumes location, you will need to change it in the `Makefile` and on the `srcs/docker-compose.yml` file.

P.S.: you can change variables such as the Domain, users and passwords on the `srcs/.env` file.

## About this project

For this project we need to setup a simple docker-compose network with the following containers:

- NGINX with TLSv1.2 or TLSv1.3.
- Wordpress + php-fpm (installed and configured).
- MariaDB.

With the following volumes:

- A volume that contains Wordpress database.
- A volume that contains Wordpress website files.

### Here is an example diagram of the expected result:

<img height=900px width=800px src="https://github.com/egulerr/Inception/blob/main/inception_readme.png"/>
