FROM debian:buster

RUN apt-get update && apt-get upgrade && apt-get install nginx;

EXPOSE 443

COPY ./conf/nginx.conf /etc/nginx/sites-enabled/nginx.conf
COPY ./tools/nginx.certs /etc/ssl/certificates/nginx.crt
COPY ./tools/nginx.key /etc/ssl/private/nginx.key

CMD ["nginx", "-g", "daemon off"]
