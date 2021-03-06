#!/bin/bash
set +e
docker stop andrew-app andrew-api andrew-db #my-redis-db
docker rm andrew-app andrew-api andrew-db #my-redis-db
find my-node-api/api/* -type d -not -name '.gitignore' -print0 | xargs -0 rm -rf --
find my-node-app/app/* -type d -not -name '.gitignore' -print0 | xargs -0 rm -rf --
set -e

cp -r /home/vagrant/api ./my-node-api/
cp -r /home/vagrant/app ./my-node-app/
rm -rf ./my-node-api/api/.git
rm -rf ./my-node-app/app/.git

pushd ./my-nodejs
docker build --tag my-nodejs:latest .
popd
# pushd ./my-node-app
# docker build --tag my-node-app:latest .
# popd
# pushd ./my-node-api
# docker build --tag my-node-api:latest .
# popd
# pushd ./my-mongodb
# docker build --tag my-mongodb:latest .
# popd
# # pushd my-redis-data
# # docker build --tag my-redis-data:latest .
# # popd
# pushd ./my-mongo-data
# docker build --tag my-mongo-data:latest .
# popd

# echo -e "\033[0;31mChecking for my-redis-data \033[0m"
# set +e
# docker ps -a | grep my-redis-data > /dev/null
# FOUND_REDIS=$?
# set -e
#
# if [[ "$FOUND_REDIS" == "0" ]]; then
#   echo -e "\033[0;32mRedis data store already exists\033[0m"
# else
#   echo -e "\033[0;34mCreating redis data container\033[0m"
#   docker create --name my-redis-data my-redis-data:latest
# fi

# echo -e "\033[0;31mChecking for my-mongo-data \033[0m"
# set +e
# docker ps -a | grep my-mongo-data > /dev/null
# FOUND_MONGO=$?
# set -e

# if [[ "$FOUND_MONGO" == "0" ]]; then
#   echo -e "\033[0;32mMongo data store already exists\033[0m"
# else
#   echo -e "\033[0;34mCreating mongo data container\033[0m"
#   docker create --name my-mongo-data my-mongo-data:latest
# fi

# echo -e "\033[0;36mRunning everything else\033[0m"
# docker run --name my-redis-db --volumes-from my-redis-data -d redis:latest
# docker run --name andrew-db -p 27017:27017 --volumes-from my-mongo-data -d my-mongodb:latest
# docker run --link andrew-db --name andrew-api -p 3001:3000 -d my-node-api:latest
# docker run --link andrew-api --name andrew-app -p 3000:3000 -d my-node-app:latest
# docker ps -a
