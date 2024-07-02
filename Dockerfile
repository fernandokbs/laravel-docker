FROM php:8.3-apache

RUN apt-get update && apt-get install -y \
    libjpeg-dev \
    libpng-dev \
    libzip-dev \
    libfreetype6-dev \
    zip \
    unzip \
    git \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd \
    && docker-php-ext-install zip pdo pdo_mysql

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

RUN composer create-project laravel/laravel .

RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

COPY DatabaseSeeder.php /var/www/html/database/seeders/DatabaseSeeder.php

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

EXPOSE 8000