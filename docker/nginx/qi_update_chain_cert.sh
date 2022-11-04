#! /bin/sh

set -e -u -x

cert_file=$(readlink -f "/etc/letsencrypt/live/${NGINX_CERTIFICATE_NAME}/fullchain.pem")

readonly cert_file

first_line_root_cert=$(grep -n -e '-----BEGIN CERTIFICATE-----' "${cert_file}" | grep -E -o -e '^[^:]+' | sed '1,2d')

readonly first_line_root_cert

sed -i "${first_line_root_cert},\$d" "${cert_file}"
