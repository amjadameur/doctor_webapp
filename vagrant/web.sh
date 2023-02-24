#!/bin/sh

sudo apt-get update

# PHP support for apache2
sudo apt-get install -y \
  php libapache2-mod-php php-mysql \
  apache2 git

# Import web application from github
cd /tmp
git clone https://github.com/thegr8dev/doctorpatientportal
sudo cp -r doctorpatientportal/* /var/www/html/
rm -rf doctorpatientportal/

# Remove apache2 default web page
sudo rm /var/www/html/index.html

# Use conn.php with appropriate mysql serverip/username/password
sudo cp /vagrant/conn.php /var/www/html/includes/conn.php

sudo systemctl restart apache2
