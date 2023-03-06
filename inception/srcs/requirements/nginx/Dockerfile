FROM debian:buster

RUN apt-get update && apt-get install nginx openssl;

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

EXPOSE 443

COPY ./conf/nginx.conf /etc/nginx/sites-enabled/nginx.conf

CMD ["nginx", "-g", "daemon off"]
