#!/bin/bash


sql+="CREATE USER 'monty'@'localhost' IDENTIFIED BY 'some_pass';"
sql+="GRANT ALL PRIVILEGES ON *.* TO 'monty'@'localhost' WITH GRANT OPTION; "
sql+="CREATE USER 'monty'@'%' IDENTIFIED BY 'some_pass';"
sql+="GRANT ALL PRIVILEGES ON *.* TO 'monty'@'%' WITH GRANT OPTION;"
out=$(mysql -uroot -proot -e "${sql}")

echo "Updating mysql configs in /etc/mysql/my.cnf."
sudo sed -i "s/bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
echo "Updated mysql bind address in /etc/mysql/my.cnf to 0.0.0.0 to allow external connections."
sudo service mysql stop
sudo service mysql start


#create the db
echo "Creating mysql db"
mysql -uroot -proot -h localhost  < /provision/magento.sql
echo "Done creating db"

#move the local xml file.
mv /var/www/html/env/local/local.xml /var/www/html/app/etc/local.xml

