FROM debian:buster

RUN apt get update -y && apt install -y mariadb-server

COPY ./config/mariadb_config.sh /tmp/mariadb_config.sh

RUN chmod +x /tmp/mariadb_config.sh

ENTRYPOINT ["/tmp/mariadb_config.sh"]

CMD ["mysqld_safe"]
