FROM php:5.6-fpm


RUN apt-get update && apt-get install -y libmemcached-dev zlib1g-dev \
    && pecl install memcached-2.2.0 \
    && docker-php-ext-enable memcached


RUN apt-get install libcurl4-openssl-dev pkg-config libssl-dev libsslcommon2-dev 

RUN pecl install solr
RUN docker-php-ext-enable solr

RUN pecl install redis
RUN docker-php-ext-enable redis

RUN pecl install mongodb
RUN docker-php-ext-enable mongodb


