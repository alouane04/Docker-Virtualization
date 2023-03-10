# FROM debian:buster

# RUN apt-get update -y && apt-get install -y mariadb-server

# COPY ./config/mariadb_config.sh /tmp/mariadb_config.sh

# RUN chmod +x /tmp/mariadb_config.sh;\
#     ./tmp/mariadb_config.sh

# ENTRYPOINT ["mysqld_safe"]

FROM debian:buster

COPY config/conf.db /temp/conf.db

RUN apt-get update -y;\
	apt-get install mariadb-server -y;\
	service mysql start;\
	chown -R alouane:alouane /var/lib/mysql;\
	sed -i "s/#port/port/" /etc/mysql/mariadb.conf.d/50-server.cnf;\
	sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf;\
	mysql -u root < /temp/conf.db;

ENTRYPOINT ["mysqld_safe"]