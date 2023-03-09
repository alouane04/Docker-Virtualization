FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y php-mysql php-fpm curl

COPY ./conf/conf.sh /
COPY ./conf/wp-config.php /

RUN chmod +x /conf.sh

CMD [ "/conf.sh" ]
