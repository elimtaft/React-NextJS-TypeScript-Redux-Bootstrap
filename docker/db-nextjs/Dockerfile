
ARG BUILD_REGISTRY
FROM ${BUILD_REGISTRY}postgres:13

ARG NEXTJS_DB_USER
ARG NEXTJS_DB_SCHEMA
ARG NEXTJS_DB_INITIAL_DATA="init.sql"

COPY [ "docker/db-nextjs/${NEXTJS_DB_INITIAL_DATA}", "/docker-entrypoint-initdb.d/${NEXTJS_DB_INITIAL_DATA}" ]

RUN set -ex; \
    sed -i -r "s/__NEXTJS_DB_SCHEMA__/${NEXTJS_DB_SCHEMA}/g" /docker-entrypoint-initdb.d/${NEXTJS_DB_INITIAL_DATA}; \
    sed -i -r "s/__NEXTJS_DB_USER__/${NEXTJS_DB_USER}/g" /docker-entrypoint-initdb.d/${NEXTJS_DB_INITIAL_DATA}; \
    chmod 644 /docker-entrypoint-initdb.d/${NEXTJS_DB_INITIAL_DATA};

ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 5432
CMD ["postgres"]
