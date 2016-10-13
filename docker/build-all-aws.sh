#!/bin/bash
set +e
docker stop andrew-app andrew-api andrew-db #my-redis-db
docker rm andrew-app andrew-api andrew-db #my-redis-db
find my-node-api/api/* -type d -not -name '.gitignore' -print0 | xargs -0 rm -rf --
find my-node-app/app/* -type d -not -name '.gitignore' -print0 | xargs -0 rm -rf --
set -e

cp -r /home/ubuntu/api ./my-node-api/
cp -r /home/ubuntu/app ./my-node-app/
rm -rf ./my-node-api/api/.git
rm -rf ./my-node-app/app/.git

pushd ./my-nodejs
docker build --tag my-nodejs:latest .
popd
