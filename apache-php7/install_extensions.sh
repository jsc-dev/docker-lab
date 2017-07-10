#!/bin/bash

echo "install pecl extensions and requirements..."
echo "install pecl extensions and requirements..." > /var/www/log.txt

if ! pecl list | grep redis >/dev/null 2>&1;
then
    pecl install redis
    echo "extension=redis.so" > /etc/php/7.1/fpm/conf.d/30-redis.ini
    echo "extension=redis.so" > /etc/php/7.1/cli/conf.d/30-redis.ini
    echo "extension=redis.so" > /etc/php/7.1/apache2/conf.d/30-redis.ini
else
    echo "pecl redis exists"
fi


if ! pecl list | grep mongodb >/dev/null 2>&1;
then

        # install mongo requirements and mongodb
        apt-get install -y libcurl4-openssl-dev pkg-config libssl-dev
        pecl install mongodb
        echo "extension=mongodb.so" > /etc/php/7.1/fpm/conf.d/30-mongodb.ini
        echo "extension=mongodb.so" > /etc/php/7.1/cli/conf.d/30-mongodb.ini
        echo "extension=mongodb.so" > /etc/php/7.1/apache2/conf.d/30-mongodb.ini

else
    echo "pecl mongo exists"
fi

if ! pecl list | grep solr >/dev/null 2>&1;
then
        # solr requirements, install curl
        apt-get install -y php7.1-curl
        apt-get install -y libcurl4-gnutls-dev

        # solr requirements, Installing phpize (it will be a part of libxml2)
        apt-get install -y libxml2
        apt-get install -y libxml2-dev

        # next, install solr
        pecl install solr
        echo "extension=solr.so" > /etc/php/7.1/fpm/conf.d/30-solr.ini
        echo "extension=solr.so" > /etc/php/7.1/cli/conf.d/30-solr.ini
        echo "extension=solr.so" > /etc/php/7.1/apache2/conf.d/30-solr.ini

else
    echo "pecl solr exists"
fi


if ! pecl list | grep zip >/dev/null 2>&1;
then
        # zip requirements
       apt-get install -qq -y libbz2-dev libzip-dev

        # next, install zip
        pecl install zip
        echo "extension=zip.so" > /etc/php/7.1/fpm/conf.d/30-zip.ini
        echo "extension=zip.so" > /etc/php/7.1/cli/conf.d/30-zip.ini
        echo "extension=zip.so" > /etc/php/7.1/apache2/conf.d/30-zip.ini

else
    echo "pecl zip exists"
fi


