FROM jscdev/apache-php7:1.0.0

# File Author / Maintainer
MAINTAINER jsc-dev

WORKDIR /var/www

#RUN cd /tmp && curl -O https://dl-ssl.google.com/dl/linux/direct/mod-pagespeed-#stable_current_amd64.deb && dpkg -i mod-pagespeed-stable_current_amd64.deb

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

CMD ["/run.sh"]
