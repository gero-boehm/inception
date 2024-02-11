#!/bin/bash

WP_URL=https://wordpress.org/latest.tar.gz

while ! mysqladmin ping -h "$DB_HOST" -P"$DB_PORT" -u"$DB_USER" -p"$DB_PASS" --silent 2>/dev/null; do
	echo "Waiting for MySQL to be ready..."
	sleep 1
done

cd "$WP_DIR"

if ! wp core is-installed --allow-root 2>/dev/null; then

	echo "Downloading..."
	wp core download --allow-root
	echo "Configuring..."
	wp config create --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DB_PASS" --dbhost="$DB_HOST" --allow-root
	echo "Installing..."
	wp core install --url="www.$USER.42.fr" --title="Inception sucks" --admin_user="$WP_USER" --admin_password="$WP_PASS" --admin_email="$WP_MAIL" --allow-root
	echo "Installing theme..."
	wp theme install twentytwentythree --activate --allow-root
	echo "Configuring post url structure..."
	wp rewrite structure '/%postname%/' --allow-root

	chmod 755 "$WP_DIR"
	chown -R www-data:www-data "$WP_DIR"
	chmod -R 755 /run/php
	chown -R www-data:www-data /run/php
fi

echo "Starting php-fpm..."
/usr/sbin/php-fpm7.4 -F
