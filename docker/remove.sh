#!/bin/bash
# WARNING: This will remove all docker containers and volumes on your system.
# DON'T USE IF YOU HAVE OTHER DOCKER PROJECTS LOCALLY

set -ex

test -e ./local.env && source ./local.env

docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker volume rm $(docker volume ls -q)
docker rmi "${IMAGE_PREFIX}-strapi" "${IMAGE_PREFIX}-nginx" "${IMAGE_PREFIX}-nextjs-app" "${IMAGE_PREFIX}-db-nextjs" "${IMAGE_PREFIX}-db-strapi"
# docker rmi '${AWS_REPOSITORY}/${IMAGE_PREFIX}-nextjs-app'
# docker rmi '${AWS_REPOSITORY}/${IMAGE_PREFIX}-strapi'
# docker rmi '${AWS_REPOSITORY}/${IMAGE_PREFIX}-db-strapi'
# docker rmi '${AWS_REPOSITORY}/${IMAGE_PREFIX}-db-nextjs'
# docker rmi '${AWS_REPOSITORY}/${IMAGE_PREFIX}-nginx'
docker rmi $(docker images -a --filter=dangling=true -q)
