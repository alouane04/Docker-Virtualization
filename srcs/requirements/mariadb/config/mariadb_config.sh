#!/bin/bash

service mysql start

# it change the bind to 0.0.0.0 bc it accept connection from all ip address.
sed -i 's/bind-address = 127.0.0.1/bind-address = 0.0.0.0' /etc/mysql/mariadb.conf.d/50-server.cnf

echo "CREATE DATABASE IF NOT EXISTS $DB_name;" > conf.sql

echo "CREATE USER IF NOT EXISTS '$DB_user'@'%' IDENTIFIED BY '$DB_password';" >> conf.sql

echo "GRANT ALL PRIVILEGES ON $DB_name.* TO '$DB_user'@'%';" >> conf.sql

echo "ALERT USER 'root'@'localhost' IDENTIFIED BY '$DB_password';" >> conf.sql

# it's reload the grant table and update the internal structures
echo "FLUSH PRIVILEGES;" >> conf.sql

mysql < conf.sql

# kill the mysql deamon process it's a way to not restarting while it wwait for wordpress to set up.
kill 'cat /var/run/mysqld/mysqld.pid'

#mysqladmin shutdown
# exec "$@"
