FROM freyrus/base-php7.0

MAINTAINER gialac <gialacmail@gmail.com>

# install mongodb driver for php
RUN pecl install mongodb
RUN echo "extension=mongodb.so" >> `php --ini | grep "Loaded Configuration" | sed -e "s|.*:\s*||"`

ADD .               /var/www
WORKDIR             /var/www
USER www-data

#RUN composer install

EXPOSE 80

# Clean up APT when done.
USER root
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*