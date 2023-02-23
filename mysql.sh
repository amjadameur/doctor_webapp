#!/bin/sh

DBUSER="doctorDbAdmin"
DBPASS="aJKYdtRKZaY4Zq5Y"

sudo apt-get update
sudo apt-get install -y mysql-server firewalld

# Allow mysql server to listen on any address instead of localhost only
sudo sed  -i 's/bind-address\s*.*/bind-address = 0.0.0.0/g' /etc/mysql/mysql.conf.d/mysqld.cnf

# Create and initialize dpp database
sudo mysql -u root -e "CREATE DATABASE dpp"
sudo mysql -u root dpp < /vagrant/dpp.sql

# Create mysql user with all privileges (to be restricted later)
sudo mysql -u root -e "CREATE USER '$DBUSER'@'%' IDENTIFIED BY '$DBPASS'"
sudo mysql -u root -e "GRANT ALL PRIVILEGES ON dpp.* TO '$DBUSER'@'%'"
sudo mysql -u root -e "FLUSH PRIVILEGES"

# Allow public access to 3306 mysql port
sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo firewall-cmd --get-active-zones
sudo firewall-cmd --zone=public --add-port=3306/tcp --permanent
sudo firewall-cmd --reload

sudo systemctl restart mysql
