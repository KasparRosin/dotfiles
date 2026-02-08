#!/bin/bash

echo "Installing PHP 8.4 with common extensions..."
sudo apt update && sudo apt install -y \
    php8.4-cli \
    php8.4-common \
    php8.4-curl \
    php8.4-mbstring \
    php8.4-xml \
    php8.4-zip \
    php8.4-intl \
    php8.4-bcmath \
    php8.4-gd \
    php8.4-mysql \
    php8.4-pgsql \
    php8.4-sqlite3 \
    php8.4-opcache

echo "Installing Composer..."
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

echo "PHP and Composer installation completed!"
php --version
composer --version
