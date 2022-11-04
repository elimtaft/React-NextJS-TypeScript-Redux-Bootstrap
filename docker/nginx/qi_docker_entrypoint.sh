#! /bin/sh

set -e -u

if [ 'nginx' = "${1}" ]; then
    qi_update_nginx_conf.sh
fi

exec "${@}"
