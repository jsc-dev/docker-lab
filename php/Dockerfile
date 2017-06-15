FROM php:5.6-alpine

RUN apt-get update && apt-get install -y libmemcached-dev zlib1g-dev
RUN pecl install memcached-2.2.0 && docker-php-ext-enable memcached
RUN pecl install redis-3.1.0 && docker-php-ext-enable redis



# Install common packages 
apk add --update \
git \
nano \
grep \
sed \
curl \
wget \
tar \
gzip \
pcre \
perl \
patch \
patchutils \
diffutils \
imagemagick



