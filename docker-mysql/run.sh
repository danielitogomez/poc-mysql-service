#!/bin/bash

if [[ $(which docker) && $(docker --version) ]]; then
	echo "Docker already installed doing your thing...i"
	echo "Running mysql container.."
		docker run --name lala-mysql -p 3306:3306 -v /Users/d.gomezamaran/TSoM/mysql/mysql-dir:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=holamundo -d mysql:latest
else
	echo "You need to install docker"
fi

mysql_container=$(docker ps | grep -i "up" | grep -i "lala-mysql" | awk '{print $1}')

docker exec -i $mysql_container -u root -p'holamundo' < schema.sql
