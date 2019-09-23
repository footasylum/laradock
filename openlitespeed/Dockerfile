ARG LARADOCK_PHP_VERSION

FROM phpearth/php:${LARADOCK_PHP_VERSION}-litespeed

LABEL maintainer="Emmanuel Okorie<eokorie2007@gmail.com>"

ARG LARADOCK_PHP_VERSION

ENV \
    # When using Composer, disable the warning about running commands as root/super user
    COMPOSER_ALLOW_SUPERUSER=1 \
    # Persistent runtime dependencies
    DEPS="curl \
        ca-certificates \
        runit \
        php${LARADOCK_PHP_VERSION} \
        php${LARADOCK_PHP_VERSION}-phar \
        php${LARADOCK_PHP_VERSION}-bcmath \
        php${LARADOCK_PHP_VERSION}-calendar \
        php${LARADOCK_PHP_VERSION}-mbstring \
        php${LARADOCK_PHP_VERSION}-exif \
        php${LARADOCK_PHP_VERSION}-ftp \
        php${LARADOCK_PHP_VERSION}-openssl \
        php${LARADOCK_PHP_VERSION}-zip \
        php${LARADOCK_PHP_VERSION}-sysvsem \
        php${LARADOCK_PHP_VERSION}-sysvshm \
        php${LARADOCK_PHP_VERSION}-sysvmsg \
        php${LARADOCK_PHP_VERSION}-shmop \
        php${LARADOCK_PHP_VERSION}-sockets \
        php${LARADOCK_PHP_VERSION}-zlib \
        php${LARADOCK_PHP_VERSION}-bz2 \
        php${LARADOCK_PHP_VERSION}-curl \
        php${LARADOCK_PHP_VERSION}-simplexml \
        php${LARADOCK_PHP_VERSION}-xml \
        php${LARADOCK_PHP_VERSION}-opcache \
        php${LARADOCK_PHP_VERSION}-dom \
        php${LARADOCK_PHP_VERSION}-xmlreader \
        php${LARADOCK_PHP_VERSION}-xmlwriter \
        php${LARADOCK_PHP_VERSION}-tokenizer \
        php${LARADOCK_PHP_VERSION}-ctype \
        php${LARADOCK_PHP_VERSION}-session \
        php${LARADOCK_PHP_VERSION}-fileinfo \
        php${LARADOCK_PHP_VERSION}-iconv \
        php${LARADOCK_PHP_VERSION}-json \
        php${LARADOCK_PHP_VERSION}-posix \
        php${LARADOCK_PHP_VERSION}-litespeed \
        litespeed"

# PHP.earth Alpine repository for better developer experience
ADD https://repos.php.earth/alpine/phpearth.rsa.pub /etc/apk/keys/phpearth.rsa.pub

RUN set -x \
    && echo "https://repos.php.earth/alpine/v3.9" >> /etc/apk/repositories \
    && apk add --no-cache $DEPS \
    && ln -sf /dev/stdout /var/lib/litespeed/logs/access.log \
    && ln -sf /dev/stderr /var/lib/litespeed/logs/error.log

COPY tags/litespeed /

EXPOSE 8088 7080

CMD ["/sbin/runit-wrapper"]
