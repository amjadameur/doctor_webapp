#!/bin/sh

DBSERVER="db01.doctorportal.in"
DBUSER="doctorDbAdmin"
DBPASS="aJKYdtRKZaY4Zq5Y"

sudo apt-get update

# PHP support for apache2
sudo apt-get install -y \
  php libapache2-mod-php php-mysql \
  apache2 git

# Import web application from github
cd /tmp && git clone https://github.com/thegr8dev/doctorpatientportal
sudo cp -r doctorpatientportal/* /var/www/html/
rm -rf doctorpatientportal/

# Remove apache2 default web page
sudo rm /var/www/html/index.html

# Use conn.php with appropriate mysql serverip/username/password
sudo sed -i "s/server_name=.*/server_name=\"$DBSERVER\";/" /var/www/html/includes/conn.php
sudo sed -i "s/user_name=.*/user_name=\"$DBUSER\";/" /var/www/html/includes/conn.php
sudo sed -i "s/password=.*/password=\"$DBPASS\";/" /var/www/html/includes/conn.php

sudo systemctl restart apache2
