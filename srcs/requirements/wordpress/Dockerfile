FROM debian:bullseye

RUN apt update -y && apt upgrade -y
RUN apt install -y curl mariadb-client php7.4 php-cgi php-fpm php-mysql

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x /usr/local/bin/wp

COPY tools/install.sh /tmp/
RUN chmod +x /tmp/install.sh

RUN mkdir -p /var/www/html
RUN mkdir -p /run/php

# RUN chmod 755 /var/www/html
# RUN chown -R www-data:www-data /var/www/html
# RUN chmod -R 755 /run/php
# RUN chown -R www-data:www-data /run/php
# RUN chmod 660 /run/php/php7.4-fpm.sock

ENTRYPOINT ["/tmp/install.sh"]
