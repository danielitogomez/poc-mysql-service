#!/bin/bash

# Variables

PASSWORD_MYSQL="hello"
CONTAINER_NAME="test-lala-mysql"
TAG="latest"
HOST_PORT="3307"
CONTAINER_HOST="3306"
HOST_VOLUME="/Users/d.gomezamaran/github/poc-mysql-service/docker-mysql/mysql-dir"
CONTAINER_DIR="/var/lib/mysql"

if [[ $(which docker) && $(docker --version) ]]; then
	echo "Docker already installed doing your thing...i"
	echo "Running mysql container.."
		docker run --name $CONTAINER_NAME -p $HOST_PORT:$CONTAINER_HOST -v $HOST_VOLUME:$CONTAINER_DIR -e MYSQL_ROOT_PASSWORD=$PASSWORD_MYSQL -d mysql:$TAG
else
	echo "You need to install docker"
fi

#mysql_container=$(docker ps | grep -i "up" | grep -i "lala-mysql" | awk '{print $1}')

#docker exec -i $mysql_container -u root -p'holamundo' < schema.sql
