#FROM httpd:2.4-alpine
#RUN apk add --update nano git curl

#FROM alpine:3.5
#RUN apk add --no-cache apache2 libxml2-dev apache2-utils
#RUN apk add --update nano git curl


FROM ubuntu:16.04
RUN apt-get update 
RUN apt-get install -qq -y apache2 libxml2-dev apache2-utils
RUN apt-get install -qq -y nano git curl zip imagemagick libxml2-utils

#RUN source /etc/apache2/envvars

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
#ENV APACHE_LOCK_DIR /var/lock/apache2

WORKDIR /var/www


# Add image configuration and scripts
ADD run.sh /run.sh
RUN chmod 755 /*.sh

COPY set_env.sh /set_env.sh
RUN ["chmod", "+x", "/set_env.sh"]
CMD ["/set_env.sh"]
RUN chmod 755 /*.sh

#CMD ["/run.sh"]
CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
