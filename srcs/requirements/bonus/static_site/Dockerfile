FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y apache2

RUN mkdir -p /var/www/html/resume-site && chown -R www-data:www-data /var/www/html/resume-site 

COPY ./tools/resume-site /var/www/html/resume-site

COPY ./conf/default.conf /etc/apache2/site-available/default.conf

CMD [ "/usr/sbin/apache2ctl", "-D", "FOREGROUND" ]
