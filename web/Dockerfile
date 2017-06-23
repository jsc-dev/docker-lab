FROM php:5.6-fpm

WORKDIR /var/www

RUN apt-get update && apt-get install -y libmemcached-dev zlib1g-dev \
    && pecl install memcached-2.2.0 \
    && docker-php-ext-enable memcached


RUN pecl install redis
RUN docker-php-ext-enable redis

# solr requirements, install curl
RUN apt-get install -y php5-curl
RUN apt-get install -y libcurl4-gnutls-dev
# solr requirements, Installing phpize (it will be a part of libxml2)
RUN apt-get install -y libxml2
RUN apt-get install -y libxml2-dev
# next, install solr
RUN pecl install solr
RUN docker-php-ext-enable solr

# install mongo requirements and mongodb
RUN apt-get install -y libcurl4-openssl-dev pkg-config libssl-dev
RUN pecl install mongodb
RUN docker-php-ext-enable mongodb

