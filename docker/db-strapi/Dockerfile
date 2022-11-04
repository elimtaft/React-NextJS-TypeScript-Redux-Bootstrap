ARG BUILD_REGISTRY
FROM ${BUILD_REGISTRY}postgres:13

ARG STRAPI_DB_USER
ARG STRAPI_DB_SCHEMA
ARG STRAPI_DB_INITIAL_DATA="init.sql"

COPY [ "docker/db-strapi/${STRAPI_DB_INITIAL_DATA}", "/docker-entrypoint-initdb.d/${STRAPI_DB_INITIAL_DATA}" ]

RUN set -ex; \
    sed -i -r "s/__STRAPI_DB_SCHEMA__/${STRAPI_DB_SCHEMA}/g" /docker-entrypoint-initdb.d/${STRAPI_DB_INITIAL_DATA}; \
    sed -i -r "s/__STRAPI_DB_USER__/${STRAPI_DB_USER}/g" /docker-entrypoint-initdb.d/${STRAPI_DB_INITIAL_DATA}; \
    chmod 644 /docker-entrypoint-initdb.d/${STRAPI_DB_INITIAL_DATA};

ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 5432
CMD ["postgres"]
