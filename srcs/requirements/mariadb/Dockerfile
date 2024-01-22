FROM debian:buster

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY conf/db-entrypoint.sh ./db-entrypoint.sh

EXPOSE 3306

RUN  mkdir -p /run/mysqld; 
RUN  chown -R mysql:mysql /run/mysqld; 
RUN  chown -R mysql:mysql /var/lib/mysql;
RUN  chmod +x ./db-entrypoint.sh

ENTRYPOINT ["sh", "/db-entrypoint.sh"]
