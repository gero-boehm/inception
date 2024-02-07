FROM debian:bullseye

ARG DB_NAME
ARG DB_USER
ARG DB_PASS
ARG DB_HOST
ARG DB_PORT
ARG DB_ROOT_PASS

RUN apt update -y && apt upgrade -y
RUN apt install -y mariadb-server gettext

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf.tmp
COPY tools/setup.sh /tmp/setup.sh
RUN chmod +x /tmp/setup.sh

RUN (cd /etc/mysql/mariadb.conf.d; envsubst < 50-server.cnf.tmp > 50-server.cnf; rm 50-server.cnf.tmp)

EXPOSE 3306

ENTRYPOINT ["/tmp/setup.sh"]
