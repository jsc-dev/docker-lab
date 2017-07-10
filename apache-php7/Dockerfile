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

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y -qq software-properties-common
RUN LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -qq -y git nano curl zip libxml2-utils dialog

RUN apt-get install -y \
	php7.1 \
	php7.1-bz2 \
	php7.1-cgi \
	php7.1-cli \
	php7.1-common \
	php7.1-curl \
	php7.1-dev \
	php7.1-enchant \
	php7.1-fpm \
	php7.1-gd \
	php7.1-imap \
	php7.1-intl \
	php7.1-json \
	php7.1-ldap \
	php7.1-mcrypt \
	php7.1-mysql \
	php7.1-opcache \
	php7.1-readline \
	php7.1-sqlite3 \
	php7.1-tidy \
        php7.1-xsl \
        php-imagick

RUN apt-get -qq -y install apache2 libapache2-mod-php7.1
RUN apt-get -qq -y install mysql-common mysql-client

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

RUN service apache2 restart

COPY install_extensions.sh /install_extensions.sh
RUN ["chmod", "+x", "/install_extensions.sh"]
RUN ["sh", "/install_extensions.sh"]
#RUN chmod 755 /*.sh
#CMD ["/install_extensions.sh"]


RUN service apache2 restart

# install composer global
RUN curl -s https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

## usefull tools, also for pimcore:
RUN apt-get install -qq -y html2text zopfli pngcrush jpegoptim exiftool


# Add image configuration and scripts
ADD run.sh /run.sh
RUN chmod 755 /*.sh

COPY set_env.sh /set_env.sh
RUN ["chmod", "+x", "/set_env.sh"]
CMD ["/set_env.sh"]
RUN chmod 755 /*.sh

CMD ["/run.sh"]
