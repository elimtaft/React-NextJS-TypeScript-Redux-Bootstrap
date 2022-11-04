#! /bin/bash

# Script to setup a local database for development purposes.
# Usage:
#   $ sudo -u postgres ./bin/db_local_setup.sh

sudo -iu postgres psql -c 'CREATE DATABASE strapidb;'
sudo -iu postgres psql -c 'CREATE USER strapiuser;'
sudo -iu postgres psql -c 'ALTER USER strapiuser CREATEDB;'
sudo -iu postgres psql -c "ALTER USER strapiuser with PASSWORD 'password';"
sudo -iu postgres psql -c 'GRANT ALL PRIVILEGES ON DATABASE strapidb TO strapiuser;'
