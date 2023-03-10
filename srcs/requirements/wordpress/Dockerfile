FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y php-mysql php-fpm curl

COPY /conf/conf.sh /

RUN chmod +x /conf.sh

ENTRYPOINT ["/bin/sh", "/conf.sh"]
