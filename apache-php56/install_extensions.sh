#!/bin/bash

echo "install pecl extensions and requirements..."
echo "install pecl extensions and requirements..." > /var/www/log.txt

if ! pecl list | grep redis >/dev/null 2>&1;
then
    pecl install redis
    echo "extension=redis.so" > /etc/php5/fpm/conf.d/30-redis.ini
    echo "extension=redis.so" > /etc/php5/cli/conf.d/30-redis.ini
    echo "extension=redis.so" > /etc/php5/apache2/conf.d/30-redis.ini
else
    echo "pecl redis exists"
fi


if ! pecl list | grep solr >/dev/null 2>&1;
then
	# solr requirements, install curl
	apt-get install -qq -y php5-curl
	apt-get install -qq -y libcurl4-gnutls-dev

	# solr requirements, Installing phpize (it will be a part of libxml2)
	apt-get install -qq -y libxml2
	apt-get install -qq -y libxml2-dev

	# next, install solr
	pecl install solr
	echo "extension=solr.so" > /etc/php5/fpm/conf.d/30-solr.ini
	echo "extension=solr.so" > /etc/php5/cli/conf.d/30-solr.ini
	echo "extension=solr.so" > /etc/php5/apache2/conf.d/30-solr.ini
else
    echo "pecl solr exists"
fi



if ! pecl list | grep mongodb >/dev/null 2>&1;
then
	# install mongodb requirements
	apt-get install -qq -y libcurl4-openssl-dev pkg-config libssl-dev
	# install mongodb
	pecl install mongodb
	echo "extension=mongodb.so" > /etc/php5/fpm/conf.d/30-mongodb.ini
	echo "extension=mongodb.so" > /etc/php5/cli/conf.d/30-mongodb.ini
	echo "extension=mongodb.so" > /etc/php5/apache2/conf.d/30-mongodb.ini
else
    echo "pecl mongo exists"
fi
