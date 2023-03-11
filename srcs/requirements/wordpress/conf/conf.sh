#!/bin/sh

apt-get update -y
apt-get install php-fpm curl php-mysql -y
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
sed -i -e 's/listen =.*/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf
mkdir -p /var/www/html
wp core download --path="/var/www/html/" --allow-root
service php7.3-fpm start
wp config create --dbname=$DB_name --dbuser=$DB_user --dbpass=$DB_password --dbhost=$DB_host --path=/var/www/html --allow-root --skip-check
wp core install --url=$DOMAIN_NAME --title=$WP_title --admin_user=$WP_admin_user --admin_password=$WP_admin_password --admin_email=$WP_admin_email --allow-root --path=/var/www/html
wp user create sayar sayar@gmail.com --user_pass=$DB_password --role=author --allow-root --path=/var/www/html/
service php7.3-fpm stop
php-fpm7.3 -F






# #!/bin/bash

# cd /var/www/html

# rm -rf *

# curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# chmod +x wp-cli.phar

# mv wp-cli.phar /usr/local/bin/wp

# sed -i 's/listen = \/run\php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

# mkdir -p /var/www/html

# wp core download --path="/var/www/html/" --allow-root

# service php7.3-fpm start

# wp config create --dbname=$DB_name --dbuser=$DB_user --dbpass=$DB_password --dbhost=$DB_host --path=/var/www/html --allow-root --skip-check --extra-php <<PHP
# define ('WP_REDIS_HOST', 'redis');
# define ('WP_REDIS_PORT', '6379');
# PHP

# wp core install --url=$DOMAIN_NAME --title=$WP_title --admin_user=$WP_admin_user --admin_password=$WP_password --admin_email=$WP_admin_email --allow-root --path=/var/www/html

# wp user create $WP_user $WP_user_email --user_pass=$DB_password --role=author --allow-root --path=/var/www/html/

# service php7.3-fpm stop

# php-fpm7.3 -F

