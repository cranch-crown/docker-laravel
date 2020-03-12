FROM php:7.4.3-fpm-alpine

COPY php.ini /usr/local/et/php

RUN docker-php-ext-install bcmath ctype json mbstring pdo_mysql tokenizer xml

RUN mkdir -p /app

WORKDIR /app
