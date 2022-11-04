#!/bin/sh

#
# Runs the nextjs-app container in the background (not as a
# daemon process) so that you can use pdb to debug your code.
#

set -ex
./compose.sh -f docker-compose.dev.yml up "${@}"
