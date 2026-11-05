FROM php:8.5-apache

RUN docker-php-ext-install pdo pdo_mysql \
    && a2enmod rewrite

COPY ./config/vhost/aniimo.local.conf /etc/apache2/sites-available/000-default.conf