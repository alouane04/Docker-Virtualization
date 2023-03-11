# The base image for the container.
FROM debian:buster

# Updating the package list, upgrading the packages, installing php and php-mysql, installing wget, and downloading the latest version of adminer and put it in the following path.
RUN apt-get update -y && apt-get upgrade -y && apt-get -y install php php-mysql && apt-get install -y wget && wget "http://www.adminer.org/latest.php" -O /var/www/html/index.php

# Starting the php server on port 8081 on all available interfaces, with the following root directory.
CMD [ "php", "-S", "0.0.0.0:8081", "-t", "/var/www/html"]
