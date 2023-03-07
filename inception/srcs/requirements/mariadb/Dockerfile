FROM debian:buster

RUN apt-get update && apt-get upgrade && apt-get install -y mariadb-server mariadb-client

COPY conf/mariadb.conf /etc/mysql/mariadb.conf
COPY tools/mariadb_setup.sh /tmp/mariadb_setup.sh

EXPOSE 3306

RUN chmod 777 /tmp/mariadb_setup.sh

ENTRYPOINT ["bash", "/tmp/mariadb_setup.sh"]

CMD ["mysqld"]