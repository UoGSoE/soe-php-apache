FROM uogsoe/soe-php-apache:7.2

RUN pecl install xdebug-2.6.0
RUN docker-php-ext-enable xdebug

RUN curl -sS https://getcomposer.org/installer | php
RUN php composer.phar global require hirak/prestissimo

EXPOSE 80
