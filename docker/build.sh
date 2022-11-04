#!/bin/bash

#
# Builds and creates the container(s) specified in docker-compose.yml
#

set -euxo pipefail

# Grab the variables set in the .env file
source ./build.env
test -e ./local.env && source ./local.env

printenv

USAGE="Usage ./build.sh db-nextjs|nginx|db-strapi|strapi|nextjs-app|all [-t <tag>] [-r <repository>] [-b <registry>] [-l] [-d]"

if [[ $# -eq 0 ]]; then
  echo "${USAGE}"
  exit 1
fi

image=${1}
shift || true

while getopts "t:r:b:ldc" opt ; do
  case ${opt} in
    t )
      t=$OPTARG
    ;;
    r )
      r=$OPTARG
    ;;
     b )
      b="${OPTARG}/"
    ;;
    l )
      l=true
    ;;
    d )
      d=true
    ;;
    c )
      c=true
    ;;
    \? )
      echo "${USAGE}"
      exit 1
    ;;
  esac
done
shift $((OPTIND -1)) || true

tag=${t:-latest}

repository=${r:-"${AWS_REPOSITORY}"}
with_latest=${l:-false}
local_build=${d:-false}
build_registry=${b:-""}
dev_build=${c:-false}

if [[ "${local_build}" == true ]] ; then
  BUILD_DB_NEXTJS="docker build -f db-nextjs/Dockerfile ../ -t ${PROJECT_NAME}/${IMAGE_PREFIX}-db-nextjs:${tag} -t ${repository}/${IMAGE_PREFIX}-db-nextjs:${tag} --build-arg NEXTJS_DB_INITIAL_DATA="init-with-sample-data.sql" --build-arg NEXTJS_DB_SCHEMA=${NEXTJS_DB_SCHEMA} --build-arg NEXTJS_DB_USER=${NEXTJS_DB_USER} --build-arg BUILD_REGISTRY=${build_registry}"
  BUILD_DB_STRAPI="docker build -f db-strapi/Dockerfile ../ -t ${PROJECT_NAME}/${IMAGE_PREFIX}-db-strapi:${tag} -t ${repository}/${IMAGE_PREFIX}-db-strapi:${tag} --build-arg STRAPI_DB_INITIAL_DATA="init-with-sample-data.sql" --build-arg STRAPI_DB_SCHEMA=${STRAPI_DB_SCHEMA} --build-arg STRAPI_DB_USER=${STRAPI_DB_USER} --build-arg BUILD_REGISTRY=${build_registry}"
  BUILD_NEXTJS_APP="docker build -f nextjs-app/Dockerfile ../ -t ${PROJECT_NAME}/${IMAGE_PREFIX}-nextjs-app:${tag} -t ${repository}/${IMAGE_PREFIX}-nextjs-app:${tag} --build-arg USER_ID=${USER_ID} --build-arg GROUP_ID=${GROUP_ID} --build-arg BACKEND_URL=${STRAPI_BACKEND_URL} --build-arg BUILD_REGISTRY=${build_registry}"
  BUILD_STRAPI="docker build -f ../.subtrees/strapi-backend/docker/Dockerfile ../.subtrees/strapi-backend/ -t ${PROJECT_NAME}/${IMAGE_PREFIX}-strapi:${tag} -t ${repository}/${IMAGE_PREFIX}-strapi:${tag} --build-arg USER_ID=${USER_ID} --build-arg GROUP_ID=${GROUP_ID} --build-arg BUILD_REGISTRY=${build_registry}"
elif [[ "${dev_build}" == true ]] ; then
  BUILD_DB_NEXTJS="docker build -f db-nextjs/Dockerfile ../ -t ${PROJECT_NAME}/${IMAGE_PREFIX}-db-nextjs:${tag} -t ${repository}/${IMAGE_PREFIX}-db-nextjs:${tag} --build-arg NEXTJS_DB_INITIAL_DATA="init-with-sample-data.sql" --build-arg NEXTJS_DB_SCHEMA=${NEXTJS_DB_SCHEMA} --build-arg NEXTJS_DB_USER=${NEXTJS_DB_USER} --build-arg BUILD_REGISTRY=${build_registry}"
  BUILD_DB_STRAPI="docker build -f db-strapi/Dockerfile ../ -t ${PROJECT_NAME}/${IMAGE_PREFIX}-db-strapi:${tag} -t ${repository}/${IMAGE_PREFIX}-db-strapi:${tag} --build-arg STRAPI_DB_INITIAL_DATA="init-with-sample-data.sql" --build-arg STRAPI_DB_SCHEMA=${STRAPI_DB_SCHEMA} --build-arg STRAPI_DB_USER=${STRAPI_DB_USER} --build-arg BUILD_REGISTRY=${build_registry}"
  BUILD_NEXTJS_APP="docker build -f nextjs-app/Dockerfile ../ -t ${PROJECT_NAME}/${IMAGE_PREFIX}-nextjs-app:${tag} -t ${repository}/${IMAGE_PREFIX}-nextjs-app:${tag} --build-arg BACKEND_URL=${STRAPI_BACKEND_URL} --build-arg BUILD_REGISTRY=${build_registry}"
  BUILD_STRAPI="docker build -f ../.subtrees/strapi-backend/docker/Dockerfile ../.subtrees/strapi-backend/ -t ${PROJECT_NAME}/${IMAGE_PREFIX}-strapi:${tag} -t ${repository}/${IMAGE_PREFIX}-strapi:${tag} --build-arg BUILD_REGISTRY=${build_registry}"
else
  BUILD_DB_NEXTJS="docker build -f db-nextjs/Dockerfile ../ -t ${PROJECT_NAME}/${IMAGE_PREFIX}-db-nextjs:${tag} -t ${repository}/${IMAGE_PREFIX}-db-nextjs:${tag} --build-arg NEXTJS_DB_SCHEMA=${NEXTJS_DB_SCHEMA} --build-arg NEXTJS_DB_USER=${NEXTJS_DB_USER} --build-arg BUILD_REGISTRY=${build_registry}"
  BUILD_DB_STRAPI="docker build -f db-strapi/Dockerfile ../ -t ${PROJECT_NAME}/${IMAGE_PREFIX}-db-strapi:${tag} -t ${repository}/${IMAGE_PREFIX}-db-strapi:${tag} --build-arg STRAPI_DB_SCHEMA=${STRAPI_DB_SCHEMA} --build-arg STRAPI_DB_USER=${STRAPI_DB_USER} --build-arg BUILD_REGISTRY=${build_registry}"
  BUILD_NEXTJS_APP="docker build -f nextjs-app/Dockerfile ../ -t ${PROJECT_NAME}/${IMAGE_PREFIX}-nextjs-app:${tag} -t ${repository}/${IMAGE_PREFIX}-nextjs-app:${tag} --build-arg BACKEND_URL=${STRAPI_BACKEND_URL} --build-arg BUILD_REGISTRY=${build_registry}"
  BUILD_STRAPI="docker build -f ../.subtrees/strapi-backend/docker/Dockerfile ../.subtrees/strapi-backend/ -t ${PROJECT_NAME}/${IMAGE_PREFIX}-strapi:${tag} -t ${repository}/${IMAGE_PREFIX}-strapi:${tag} --build-arg BUILD_REGISTRY=${build_registry}"
fi

BUILD_NGINX="docker build -f nginx/Dockerfile ../ -t ${PROJECT_NAME}/${IMAGE_PREFIX}-nginx:${tag} -t ${repository}/${IMAGE_PREFIX}-nginx:${tag} --build-arg BUILD_REGISTRY=${build_registry}"

apply_tags () {
  local image=${1}
  docker tag "${PROJECT_NAME}/${IMAGE_PREFIX}-${image}:${tag}" "${repository}/${IMAGE_PREFIX}-${image}:${tag}"
  if [[ "${with_latest}" == true ]] ; then
    docker tag "${PROJECT_NAME}/${IMAGE_PREFIX}-${image}:${tag}" "${repository}/${IMAGE_PREFIX}-${image}:latest"
  fi
}

# this could use getopts for building multiple containers
case ${image} in
  nginx)
    eval "${BUILD_NGINX}" && apply_tags nginx
    ;;
  db-nextjs)
    eval "${BUILD_DB_NEXTJS}" && apply_tags db-nextjs
    ;;
  db-strapi)
    eval "${BUILD_DB_STRAPI}" && apply_tags db-strapi
    ;;
  nextjs-app)
    eval "${BUILD_NEXTJS_APP}" && apply_tags nextjs-app
    ;;
  strapi)
    eval "${BUILD_STRAPI}" && apply_tags strapi
    ;;
  all)
    eval "${BUILD_NGINX}" && apply_tags nginx
    eval "${BUILD_DB_NEXTJS}" && apply_tags db-nextjs
    eval "${BUILD_DB_STRAPI}" && apply_tags db-strapi
    eval "${BUILD_NEXTJS_APP}" && apply_tags nextjs-app
    eval "${BUILD_STRAPI}" && apply_tags strapi
    ;;
  *)
    echo "${USAGE}"
    exit 1
  ;;
esac
