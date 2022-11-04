#!/bin/sh

#
# Creates the .env file by combining defaults and local variables
#

set -ex

# combine default and local
cat local.env > .env
cat defaults.env >> .env
