FROM php:7.4.3-cli-alpine

COPY php.ini /usr/local/etc/php

RUN apk --no-cache add autoconf make gcc g++ tzdata

ARG TZ=${TZ}

RUN cp /usr/share/zoneinfo/${TZ} /etc/localtime

RUN pecl install \
    xdebug \
    timecop-beta

RUN pear PHP_CodeSniffer

RUN docker-php-ext-install pdo_mysql

RUN docker-php-ext-enable xdebug timecop

RUN mkdir -p /app

WORKDIR /app