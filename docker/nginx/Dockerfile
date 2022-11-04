ARG BUILD_REGISTRY
FROM ${BUILD_REGISTRY}nginx:1.19.0-alpine AS ngx_brotli_build

ENV NGX_MODULE_COMMIT 9aec15e2aa6feea2113119ba06460af70ab3ea62
ENV NGX_MODULE_PATH ngx_brotli

ENV MORE_HEADERS_VERSION=0.33
ENV MORE_HEADERS_GITREPO=openresty/headers-more-nginx-module

ENV NGX_CACHE_PURGE_MODULE_GITREPO=nginx-modules/ngx_cache_purge
ENV NGX_CACHE_PURGE_MODULE_VERSION=2.5.1

RUN wget "http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz" -O nginx.tar.gz && \
    wget "https://github.com/google/ngx_brotli/archive/${NGX_MODULE_COMMIT}.tar.gz" -O ${NGX_MODULE_PATH}.tar.gz && \
    wget "https://github.com/${MORE_HEADERS_GITREPO}/archive/v${MORE_HEADERS_VERSION}.tar.gz" -O extra_module.tar.gz && \
    wget "https://github.com/${NGX_CACHE_PURGE_MODULE_GITREPO}/archive/refs/tags/${NGX_CACHE_PURGE_MODULE_VERSION}.tar.gz" -O proxy_cache_module.tar.gz

# For latest build deps, see https://github.com/nginxinc/docker-nginx/blob/master/mainline/alpine/Dockerfile
RUN apk add --no-cache --virtual .build-deps \
    gcc \
    libc-dev \
    make \
    openssl-dev \
    pcre-dev \
    zlib-dev \
    linux-headers \
    libxslt-dev \
    gd-dev \
    geoip-dev \
    perl-dev \
    libedit-dev \
    mercurial \
    bash \
    alpine-sdk \
    findutils \
    brotli-dev

# Reuse same cli arguments as the nginx:alpine image used to build
RUN CONFARGS=$(nginx -V 2>&1 | sed -n -e 's/^.*arguments: //p') \
    tar -zxf nginx.tar.gz && \
    tar -xzf "${NGX_MODULE_PATH}.tar.gz" && \
    tar -xzf extra_module.tar.gz && \
    tar -xzf proxy_cache_module.tar.gz && \
    cd nginx-$NGINX_VERSION && \
    ./configure --with-compat $CONFARGS --add-dynamic-module="$(pwd)/../${NGX_MODULE_PATH}-${NGX_MODULE_COMMIT}" --add-dynamic-module="$(pwd)/../headers-more-nginx-module-0.33" --add-dynamic-module="$(pwd)/../ngx_cache_purge-2.5.1" && \
    make && make install

# save /usr/lib/*so deps
RUN mkdir /so-deps && cp -L $(ldd /usr/local/nginx/modules/ngx_http_brotli_filter_module.so 2>/dev/null | grep '/usr/lib/' | awk '{ print $3 }' | tr '\n' ' ') /so-deps

# prepend load_module commands to main nginx.conf
RUN echo "load_module /usr/local/nginx/modules/ngx_http_brotli_filter_module.so;" | cat - /etc/nginx/nginx.conf > /tmp/out && mv /tmp/out /etc/nginx/nginx.conf
RUN echo "load_module /usr/local/nginx/modules/ngx_http_brotli_static_module.so;" | cat - /etc/nginx/nginx.conf > /tmp/out && mv /tmp/out /etc/nginx/nginx.conf
RUN echo "load_module /usr/local/nginx/modules/ngx_http_headers_more_filter_module.so;" | cat - /etc/nginx/nginx.conf > /tmp/out && mv /tmp/out /etc/nginx/nginx.conf
RUN echo "load_module /usr/local/nginx/modules/ngx_http_cache_purge_module.so;" | cat - /etc/nginx/nginx.conf > /tmp/out && mv /tmp/out /etc/nginx/nginx.conf

ARG BUILD_REGISTRY
FROM ${BUILD_REGISTRY}nginx:1.19.0-alpine

COPY --from=ngx_brotli_build /so-deps /usr/lib
COPY --from=ngx_brotli_build /etc/nginx/nginx.conf /etc/nginx/nginx.conf
COPY --from=ngx_brotli_build /usr/local/nginx/modules/ngx_http_brotli_filter_module.so /usr/local/nginx/modules/ngx_http_brotli_filter_module.so
COPY --from=ngx_brotli_build /usr/local/nginx/modules/ngx_http_brotli_static_module.so /usr/local/nginx/modules/ngx_http_brotli_static_module.so
COPY --from=ngx_brotli_build /usr/local/nginx/modules/ngx_http_headers_more_filter_module.so /usr/local/nginx/modules/ngx_http_headers_more_filter_module.so
COPY --from=ngx_brotli_build /usr/local/nginx/modules/ngx_http_cache_purge_module.so /usr/local/nginx/modules/ngx_http_cache_purge_module.so

RUN set -ex \
    ; rm -f /etc/nginx/conf.d/default.conf

RUN set -ex \
    ; mkdir -p /etc/nginx/snippets

COPY [ "docker/nginx/conf/default.conf.template", "/etc/nginx/conf.d/" ]
COPY [ "docker/nginx/conf/nginx-strapi.conf.template", "/etc/nginx/conf.d/" ]
COPY [ "docker/nginx/conf/ssl.conf.template", "/etc/nginx/conf.d/" ]
COPY [ "docker/nginx/conf/brotli.conf", "/etc/nginx/conf.d/" ]
COPY [ "docker/nginx/qi_docker_entrypoint.sh", "/usr/local/bin/" ]
COPY [ "docker/nginx/qi_update_nginx_conf.sh", "/usr/local/bin/" ]
COPY [ "docker/nginx/qi_update_chain_cert.sh", "/usr/local/bin/" ]
COPY [ "docker/nginx/general-security-header.conf.template", "/etc/nginx/snippets/" ]
COPY [ "docker/nginx/csp_log.conf", "/etc/nginx/conf.d/" ]
COPY [ "docker/nginx/robots-dev.txt.template", "/" ]
COPY [ "docker/nginx/robots-test.txt.template", "/" ]
COPY [ "docker/nginx/robots-production.txt.template", "/" ]

RUN set -ex \
    ; chmod a+rx \
        /usr/local/bin/qi_docker_entrypoint.sh \
        /usr/local/bin/qi_update_nginx_conf.sh \
        /usr/local/bin/qi_update_chain_cert.sh

ENTRYPOINT [ "qi_docker_entrypoint.sh" ]
CMD [ "nginx", "-g", "daemon off;" ]
