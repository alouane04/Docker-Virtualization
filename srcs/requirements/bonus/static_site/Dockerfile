FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y apache2

RUN service apache2 restart

COPY ./car /var/www/html

COPY ./conf/default.conf /etc/apache2/site-available/default.conf

CMD [ "/usr/sbin/apache2ctl", "-D", "FOREGROUND" ]