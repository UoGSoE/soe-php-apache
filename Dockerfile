FROM php:7.2-apache

RUN apt-get update && \
    apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng-dev libgmp-dev libldap2-dev netcat sqlite3 libsqlite3-dev git gnupg2 && \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install gd pdo pdo_mysql pdo_sqlite zip gmp bcmath pcntl ldap sysvmsg exif xdebug \
    && a2enmod rewrite

COPY vhost.conf /etc/apache2/sites-available/000-default.conf

RUN set -o pipefail && curl -sS https://getcomposer.org/installer | php
RUN php composer.phar global require hirak/prestissimo

EXPOSE 80
