FROM php:5.6.12-fpm

RUN apt-get update \
    && apt-get install -y git curl bzip2 vim libssl-dev zlib1g-dev postgresql libpq-dev libxrender1 libicu-dev g++ libjpeg-dev libjpeg62 libfontconfig-dev \
    && pecl install apcu-beta mongo \
    && echo extension=apcu.so > /usr/local/etc/php/conf.d/apcu.ini \
    && docker-php-ext-install zip mbstring intl \
    && apt-get -y install php5-gd

ADD php.ini /usr/local/etc/php/php.ini

RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/bin/composer

WORKDIR /var/www/project
