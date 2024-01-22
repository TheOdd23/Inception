FROM debian:buster


RUN apt-get update && \
	apt-get install -y mariadb-client \
	wget \
    php7.3 \
    php7.3-fpm \
    php-mysql

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/html
RUN chown www-data:www-data /var/www/html
RUN chmod 755 -R /var/www/html

WORKDIR /var/www/html
COPY conf/www.conf /etc/php/7.3/fpm/pool.d
COPY conf/wp-entrypoint.sh ./wp-entrypoint.sh

RUN chmod +x ./wp-entrypoint.sh

EXPOSE 9000

ENTRYPOINT [ "bash", "./wp-entrypoint.sh" ]

CMD ["php-fpm7.3", "-F"]
