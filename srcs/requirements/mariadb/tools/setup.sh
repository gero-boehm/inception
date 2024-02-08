#!/bin/bash

# # Start MariaDB
# mysqld_safe &
service mariadb start
# # Wait for MariaDB to start
# sleep 10s

# Set up database and users
mysql -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"
mysql -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';"
mysql -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';"
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASS}';"
mysql -e "FLUSH PRIVILEGES;"

service mariadb stop
# # Stop MariaDB
# mysqladmin -u root -p${DB_ROOT_PASS} shutdown

# # Start MariaDB as the main process
# exec mysqld
mysqld_safe