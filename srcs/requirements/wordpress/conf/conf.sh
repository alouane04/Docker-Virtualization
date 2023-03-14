#!/bin/bash

# Downloading the wp-cli.phar file from the github repository (it's allowing for transfer data from/to server using HTTP/HTTPS/FTP...).
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# Changing the owner of the directory of /var/www/html and all subdirectories to www-data:www-data.
chown -R www-data:www-data /var/www/html/

# Changing the owner of /var/www/html/ to 755
chmod -R 755 /var/www/html/ 

# Making the file executable.
chmod +x wp-cli.phar

# Moving the wp-cli.phar file to the /usr/local/bin/wp directory.
mv wp-cli.phar /usr/local/bin/wp

# Changing the directory to /var/www/html/
cd /var/www/html/

# Downloading the latest version of WordPress.
runuser -u www-data -- wp core download

# It's a command that installs WordPress.
runuser -u www-data -- wp core install --url=$DOMAIN_NAME --title="My Wordpress Site" --admin_user=$WP_admin_user --admin_password=$WP_admin_password --admin_email=$WP_admin_email

# It's creating a new user with the username of , the email of , the password of
#  and the role of author.
runuser -u www-data -- wp user create $WP_user $WP_user_email --user_pass=$WP_user_password --role='author'

# It creates a new file called wp-config.php.
touch wp-config.php

# It copies the default configuration to wp-config.php
cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

# Replacing the line 36 of the file /etc/php/7.3/fpm/pool.d/www.conf with the value 9000.
sed -i '36 s/\/run\/php\/php7.3-fpm.sock/9000/' /etc/php/7.3/fpm/pool.d/www.conf

# It's replacing the string "database_name_here" with the value of the variable  in the file
# /var/www/html/wp-config.php.
sed -i 's/database_name_here/'$DB_name'/g' /var/www/html/wp-config.php

# It's replacing the string "username_here" with the value of the variable  in the file
# /var/www/html/wp-config.php.
sed -i 's/username_here/'$DB_user'/g' /var/www/html/wp-config.php
# set The Hostname of the That base

# It's replacing the string "password_here" with the value of the variable  in the file
# /var/www/html/wp-config.php.
sed -i 's/password_here/'$DB_password'/g' /var/www/html/wp-config.php

# It's replacing the string "localhost" with the value of the variable mariadb in the file
# var/www/html/wp-config.php.
sed -i 's/localhost/'mariadb'/g' /var/www/html/wp-config.php

# It's a command that sets the value of the FORCE_SSL_ADMIN constant in the WordPress configuration
# file to "false".
# This constant controls whether SSL is forced for the WordPress admin area or not.
runuser -u www-data -- wp config set FORCE_SSL_ADMIN 'false'

# It's installing and activating the plugin of redis-cache.
runuser -u www-data -- wp plugin install redis-cache

runuser -u www-data -- wp plugin activate redis-cache

# It's a command that sets the value of the WP_REDIS_HOST constant in the WordPress configuration file
# to "redis".
# This constant controls the hostname of the Redis server.
runuser -u www-data -- wp config set WP_REDIS_HOST 'redis'

# It's a command that sets the value of the WP_REDIS_PORT constant in the WordPress configuration file
# to "6379".
# This constant controls the port of the Redis server.
runuser -u www-data -- wp config set WP_REDIS_PORT '6379'

# It's a command that sets the value of the WP_CACHE constant in the WordPress configuration file to
# "true".
# This constant controls whether the object cache is enabled or not.
runuser -u www-data -- wp config set WP_CACHE 'true'

# It's a command that enables the object cache.
runuser -u www-data -- wp redis enable

# It's a command that executes the command line arguments.
exec "$@"
