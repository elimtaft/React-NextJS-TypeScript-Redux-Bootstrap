#!/bin/sh

set -ex

test -e ./local.env && source ./local.env

docker exec -it "${IMAGE_PREFIX}-nextjs-app" yarn lint
