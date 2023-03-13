FROM    debian:buster

# This command is installing the following packages:
# - php
# - php-curl
# - php-mysql
# - php7.3-fpm
# - curl
# - sendmail
RUN apt update && apt install -y php php-curl php-mysql && apt install -y php7.3-fpm && apt install -y curl

# Creating a directory for the php-fpm socket.
RUN mkdir -p /run/php/

# Copying the file conf.sh from the conf directory in the current directory to the script.sh file in the root directory.
COPY ./conf/conf.sh /script.sh

# Making the script executable.
RUN chmod +x /script.sh

# Running the script.sh file.
ENTRYPOINT [ "/script.sh" ]

# Running the php-fpm7.3 command (The PHP FastCGI Process Manager.) with the -F flag (The -F flag means that the process manager will stay in the foreground and will not daemonize.).
CMD [ "php-fpm7.3", "-F" ]