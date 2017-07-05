FROM ubuntu:16.04

# File Author / Maintainer
MAINTAINER jsc-dev

WORKDIR /var/www

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2


RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y git nano curl zip libxml2-utils

RUN apt-get install -y \
	php7.0 \
	php7.0-bz2 \
	php7.0-cgi \
	php7.0-cli \
	php7.0-common \
	php7.0-curl \
	php7.0-dev \
	php7.0-enchant \
	php7.0-fpm \
	php7.0-gd \
	php7.0-imap \
	php7.0-intl \
	php7.0-json \
	php7.0-ldap \
	php7.0-mcrypt \
	php7.0-mysql \
	php7.0-opcache \
	php7.0-readline \
	php7.0-sqlite3 \
	php7.0-tidy \
        php7.0-xsl

RUN apt-get -qq -y install apache2 libapache2-mod-php7.0
RUN service apache2 stop && service apache2 start

##insert: ServerName localhost in /etc/apache2/httpd.conf
RUN echo "ServerName a7machine" >> /etc/apache2/conf-available/jsc-hostname.conf
RUN a2enconf jsc-hostname


# enable apache modules
RUN a2enmod remoteip
RUN a2enmod rewrite
RUN a2enmod actions
RUN a2enmod ssl
RUN a2enmod headers
RUN a2enmod expires

RUN pecl install redis
RUN echo "extension=redis.so" > /etc/php/7.0/fpm/conf.d/30-redis.ini
RUN echo "extension=redis.so" > /etc/php/7.0/cli/conf.d/30-redis.ini
RUN echo "extension=redis.so" > /etc/php/7.0/apache2/conf.d/30-redis.ini


# solr requirements, install curl
RUN apt-get install -y php7.0-curl
RUN apt-get install -y libcurl4-gnutls-dev
# solr requirements, Installing phpize (it will be a part of libxml2)
RUN apt-get install -y libxml2
RUN apt-get install -y libxml2-dev
# next, install solr
RUN pecl install solr
RUN echo "extension=solr.so" > /etc/php/7.0/fpm/conf.d/30-solr.ini
RUN echo "extension=solr.so" > /etc/php/7.0/cli/conf.d/30-solr.ini
RUN echo "extension=solr.so" > /etc/php/7.0/apache2/conf.d/30-solr.ini


# install mongo requirements and mongodb
RUN apt-get install -y libcurl4-openssl-dev pkg-config libssl-dev
RUN pecl install mongodb
RUN echo "extension=mongodb.so" > /etc/php/7.0/fpm/conf.d/30-mongodb.ini
RUN echo "extension=mongodb.so" > /etc/php/7.0/cli/conf.d/30-mongodb.ini
RUN echo "extension=mongodb.so" > /etc/php/7.0/apache2/conf.d/30-mongodb.ini


RUN service apache2 restart

# Add image configuration and scripts
ADD run.sh /run.sh
RUN chmod 755 /*.sh

COPY set_env.sh /set_env.sh
RUN ["chmod", "+x", "/set_env.sh"]
CMD ["/set_env.sh"]
RUN chmod 755 /*.sh

CMD ["/run.sh"]

