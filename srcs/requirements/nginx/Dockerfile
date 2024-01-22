FROM debian:buster

RUN apt-get update && \
    apt-get upgrade -y && \
	apt-get install -y nginx \
    -y openssl

EXPOSE 443

RUN mkdir -p /var/www/html /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=CA/ST=Quebec/L=Quebec City/O=42/OU=42/CN=anhebert.42.fr"

COPY conf/nginx.conf /etc/nginx/sites-enabled/default

CMD ["nginx", "-g", "daemon off;"]
