#!/bin/sh

# Examples:
#   ./compose.sh up
#   ./compose.sh build
#   ./compose.sh up --build

: "${PROJECT_NAME:=sampleproject}"
: "${DOCKER_COMPOSE_FILE:=docker-compose.yml}"

set -ex

exec env TMPDIR="$(pwd)/tmp" docker-compose -p "${PROJECT_NAME}" -f "${DOCKER_COMPOSE_FILE}" "${@}"
