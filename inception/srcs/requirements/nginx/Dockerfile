FROM debian:buster

RUN apt-get update && apt-get install nginx openssl;

EXPOSE 443

COPY ./conf/nginx.conf /etc/nginx/sites-enabled/nginx.conf

CMD ["nginx", "-g", "daemon off"]
