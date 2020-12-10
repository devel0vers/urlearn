#!/bin/bash

# goto basedir
cd $(dirname "$0")

# mkdir data/mysql -p
# mkdir logs/apache2 -p
# mkdir logs/mysql -p

docker-compose pull
docker-compose stop
docker-compose down
docker-compose up --build -d 