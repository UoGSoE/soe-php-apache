FROM php:7.1-apache

RUN apt-get update && \
    apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng-dev libgmp-dev libldap2-dev netcat sqlite3 libsqlite3-dev && \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install gd pdo pdo_mysql pdo_sqlite zip gmp bcmath pcntl ldap sysvmsg \
    && a2enmod rewrite

COPY vhost.conf /etc/apache2/sites-available/000-default.conf

EXPOSE 80
