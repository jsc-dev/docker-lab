FROM ubuntu:15.04

WORKDIR /var/www

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2


RUN apt-get update && \
    apt-get upgrade && \
    apt-get install -y git nano curl zip imagemagick libxml2-utils

RUN apt-get -qq -y install apache2 apache2-doc libapache2-mod-php5
RUN service apache2 restart

RUN apt-get -qq -y install php5-common php5-fpm php5-mysql php5-cli php5-curl php5-dev
RUN apt-get -y install php5-mysqlnd php5-gd php5-intl php-pear php5-imagick php5-imap php5-mcrypt php5-memcache php5-sqlite php5-tidy php5-json php5-ldap
#php5-xml php5-xdebug
RUN apt-get -qq -y install mysql-common mysql-client

##insert: ServerName localhost in /etc/apache2/httpd.conf
RUN echo "ServerName jdmachine" >> /etc/apache2/conf-available/jsc-hostname.conf
RUN a2enconf jsc-hostname


# enable apache modules
RUN a2enmod remoteip
RUN a2enmod rewrite
RUN a2enmod actions
RUN a2enmod ssl
RUN a2enmod headers
RUN a2enmod expires

RUN php5enmod mcrypt


RUN apt-get update && apt-get install -y libmemcached-dev zlib1g-dev \
    && pecl install memcached-2.2.0
#RUN docker-php-ext-enable memcached
RUN echo "extension=memcached.so" > /etc/php5/fpm/conf.d/30-memcached.ini
RUN echo "extension=memcached.so" > /etc/php5/cli/conf.d/30-memcached.ini
RUN echo "extension=memcached.so" > /etc/php5/apache2/conf.d/30-memcached.ini

RUN pecl install redis
#RUN docker-php-ext-enable redis
RUN echo "extension=redis.so" > /etc/php5/fpm/conf.d/30-redis.ini
RUN echo "extension=redis.so" > /etc/php5/cli/conf.d/30-redis.ini
RUN echo "extension=redis.so" > /etc/php5/apache2/conf.d/30-redis.ini


# solr requirements, install curl
RUN apt-get install -y php5-curl
RUN apt-get install -y libcurl4-gnutls-dev
# solr requirements, Installing phpize (it will be a part of libxml2)
RUN apt-get install -y libxml2
RUN apt-get install -y libxml2-dev
# next, install solr
RUN pecl install solr
#RUN docker-php-ext-enable solr
RUN echo "extension=solr.so" > /etc/php5/fpm/conf.d/30-solr.ini
RUN echo "extension=solr.so" > /etc/php5/cli/conf.d/30-solr.ini
RUN echo "extension=solr.so" > /etc/php5/apache2/conf.d/30-solr.ini


# install mongo requirements and mongodb
RUN apt-get install -y libcurl4-openssl-dev pkg-config libssl-dev
RUN pecl install mongodb
#RUN docker-php-ext-enable mongodb
RUN echo "extension=mongodb.so" > /etc/php5/fpm/conf.d/30-mongodb.ini
RUN echo "extension=mongodb.so" > /etc/php5/cli/conf.d/30-mongodb.ini
RUN echo "extension=mongodb.so" > /etc/php5/apache2/conf.d/30-mongodb.ini

RUN service apache2 restart
RUN service php5-fpm restart

# Add image configuration and scripts
ADD run.sh /run.sh
RUN chmod 755 /*.sh

COPY set_env.sh /set_env.sh
RUN ["chmod", "+x", "/set_env.sh"]
CMD ["/set_env.sh"]
RUN chmod 755 /*.sh

CMD ["/run.sh"]
