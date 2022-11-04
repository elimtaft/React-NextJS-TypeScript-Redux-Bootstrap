ARG BUILD_REGISTRY
FROM ${BUILD_REGISTRY}strapi/base:14

ARG USER_ID=1001
ARG GROUP_ID=1001
RUN addgroup --system --gid ${GROUP_ID} strapi
RUN adduser --system --uid ${USER_ID} strapi

WORKDIR /app

COPY --chown=strapi:strapi package.json .
COPY --chown=strapi:strapi yarn.lock .

RUN yarn --immutable

RUN set -ex \
    ; touch .env \
    ; mkdir -p .cache \
    ; mkdir -p build \
    ; chown strapi:strapi .env \
    ; chown strapi:strapi .cache \
    ; chown strapi:strapi build

COPY --chown=strapi:strapi config ./config
COPY --chown=strapi:strapi database ./database
COPY --chown=strapi:strapi favicon.ico ./favicon.ico
COPY --chown=strapi:strapi public ./public
COPY --chown=strapi:strapi src ./src

RUN chown strapi:strapi ./node_modules

USER strapi

EXPOSE 1337

CMD ["sh", "-c", "yarn build; yarn ${NODE_ENV}"]
