FROM ubuntu:16.04

# File Author / Maintainer
MAINTAINER jsc-dev

WORKDIR /var/www

#on ubuntu:
RUN usermod -u 1000 www-data
# on osx:
#RUN usermod -u 501 www-data
#RUN usermod -G staff www-data

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y -qq dialog software-properties-common
RUN LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y git nano curl zip
RUN apt-get install -y imagemagick libxml2-utils
RUN apt-get install -y libxml2-utils

RUN apt-get -qq -y install php7.0 php5.6-mysql php5.6-cli php5.6-curl php5.6-json 
RUN apt-get -qq -y install php5.6-sqlite3 php5.6-mcrypt php5.6-curl php-xdebug 
RUN apt-get -qq -y install php5.6-mbstring libapache2-mod-php5.6 libapache2-mod-php7.0 
RUN apt-get -qq -y install apache2 php5.6-common php5.6-fpm php5.6-dev 
RUN apt-get -qq -y install php5.6-gd php5.6-intl php-pear php5.6-imap php5.6-ldap 
RUN apt-get -qq -y install php5.6-sqlite php5.6-tidy php5.6-xsl php5.6-xml php5.6-xmlrpc
RUN apt-get -qq -y install mysql-common mysql-client 

RUN a2dismod php7.0 ; a2enmod php5.6 ; service apache2 restart ; echo 1 | update-alternatives --config php 
RUN a2enmod proxy_fcgi setenvif
RUN a2enconf php5.6-fpm


##insert: ServerName localhost in /etc/apache2/httpd.conf
RUN echo "ServerName machine1" >> /etc/apache2/conf-available/jsc-hostname.conf
RUN a2enconf jsc-hostname


# enable apache modules
RUN a2enmod remoteip
RUN a2enmod rewrite
RUN a2enmod actions
RUN a2enmod ssl 
RUN a2enmod headers 
RUN a2enmod expires

#RUN php5enmod mcrypt

COPY install_extensions.sh /install_extensions.sh
RUN ["chmod", "+x", "/install_extensions.sh"]
RUN ["sh", "/install_extensions.sh"]


#RUN service apache2 restart
#RUN service php5-fpm restart

# install composer global
RUN curl -s https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer 

RUN pear install Log

# nodejs
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get -qq -y install nodejs
RUN nodejs -v
RUN npm -v

#install npm packages
RUN npm cache clear
RUN npm install -g coffee-script
RUN npm install -g bower
RUN npm install -g grunt-cli

# Add image configuration and scripts
ADD run.sh /run.sh
RUN chmod 755 /*.sh

COPY set_env.sh /set_env.sh
RUN ["chmod", "+x", "/set_env.sh"]
CMD ["/set_env.sh"]
RUN chmod 755 /*.sh

##TODO macht beim erst start probleme 
#ENTRYPOINT ["/set_env.sh"]

CMD ["/run.sh"]
