FROM php:7.4.33-apache

ENV DBSERVER="db01"
ENV DBUSER="doctorDbAdmin"
ENV DBPASS="aJKYdtRKZaY4Zq5Y"

RUN apt-get update && apt-get install -y \
  git \
  && rm -rf /var/lib/apt/lists/*

# MYSQL-PHP module
RUN docker-php-ext-install mysqli

# Use the default production configuration
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

RUN git clone https://github.com/thegr8dev/doctorpatientportal /tmp/doctor \
  && cp -r /tmp/doctor/* . \
  && rm -rf /tmp/doctor

# Use conn.php with appropriate mysql serverip/username/password
RUN sed -i "s/server_name=.*/server_name=\"$DBSERVER\";/" includes/conn.php
RUN sed -i "s/user_name=.*/user_name=\"$DBUSER\";/" includes/conn.php
RUN sed -i "s/password=.*/password=\"$DBPASS\";/" includes/conn.php
