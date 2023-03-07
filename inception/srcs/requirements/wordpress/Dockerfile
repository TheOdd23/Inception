FROM debian:buster

RUN apt-get update && apt-get upgrade && apt-get install -y mariadb-client \
															apache2 \
															dumb-init \
															php8 \
															php8-curl \
															php8-dom \
															php8-exif \
															php8-fileinfo \
															php8-hash \
															php8-imagick \
															php8-json \
															php8-mbstring \
															php8-mysqli \
															php8-openssl \
															php8-pcre \
															php8-sodium \
															php8-xml \
															php8-zip \
															php8-wget 

COPY conf/www.conf /etc/php8/php-fpm.d/www.pool.d
COPY conf/wp_config.php tmp/wp_config.php
COPY tools/wp_setup.sh tmp/wp_setup.sh

# Installation of Wordpress, "construction" of new directories and give them the right rights
RUN cd /tmp && wget https://wordpress.org/latest.tar.gz
RUN tar -xvf latest.tar.gz && cp -R wordpress /var/www/html
RUN chown -R www-data /var/www/html/wordpress/
RUN chmod -R 755 /var/www/html/wordpress/
RUN mkdir /var/www/html/wordpress/wp-content/uploads
RUN chown -R www-data:www-data /var/www/html/wordpress/wp-content/uploads/
# Giving the execute rights for the script
RUN chmod 777 /tmp/wp_setup.sh

EXPOSE 9000

#It acts as PID 1 and immediately spawns your command as a child process, taking care to properly handle and forward signals as they are received.
#Prevents signals mis-handled and Orphaned zombie child
ENTRYPOINT ["usr/bin/dumb-init", "--"]

#Execute wordpress script
CMD ["bash", "./wp_setup.sh"]



