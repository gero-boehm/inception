FROM debian:bullseye

RUN apt update -y && apt upgrade -y
RUN apt install -y mariadb-server mariadb-client

RUN mkdir -p /var/lib/mysql && \
    mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/lib/mysql && \
    chown -R mysql:mysql /var/run/mysqld

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/setup.sh /tmp/setup.sh
RUN chmod +x /tmp/setup.sh

EXPOSE 3306

# USER mysql
ENTRYPOINT ["/tmp/setup.sh"]
# CMD tail -f /dev/null
