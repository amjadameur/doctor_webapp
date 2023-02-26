FROM php:7.4.33-apache

# MYSQL-PHP module
RUN docker-php-ext-install mysqli

# Use the default production configuration
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

COPY src/ /var/www/html/
