FROM debian:buster

# Copying the file conf.db from the config folder to the temp folder.
COPY config/conf.db /temp/conf.db

# Installing the mariadb-server, starting the service, and then changing the port and ip address to 0.0.0.0 and 3306 respectively.
RUN apt-get update -y && apt-get install mariadb-server -y && service mysql start && sed -i "s/#port/port/" /etc/mysql/mariadb.conf.d/50-server.cnf && sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf && mysql -u root < /temp/conf.db

# Starting the mysql server.
ENTRYPOINT ["mysqld_safe"]