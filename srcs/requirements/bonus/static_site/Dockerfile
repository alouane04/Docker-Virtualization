FROM debian:buster

# Updating the package list, upgrading the packages, and installing apache2.
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y apache2

# RUN mkdir -p /var/www/html && chown -R www-data:www-data /var/www/html


# Restarting the apache2 service.
# RUN service apache2 restart

COPY ./conf/default.conf /etc/apache2/sites-available/default.conf
# Copying the contents of the car directory into the /var/www/html directory.
COPY ./car/index.html /var/www/html/index.html

#The command that is used to control the apache2 service, The -D FOREGROUND option is used to start the apache2 service in the foreground..
CMD [ "/usr/sbin/apache2ctl", "-D", "FOREGROUND" ]