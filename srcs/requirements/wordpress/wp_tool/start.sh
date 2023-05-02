#!/bin/sh
if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else

    echo $DB_NAME;
    wp core download;
    cp wp-config-sample.php wp-config.php
    wp config create --force --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$DB_HOST;
    echo "wp-config.php file updated successfully!";
    wp core install --url=eguler.42.fr --title="Docker 42 WordPress" \
    --admin_user=$DB_USER --admin_password=$DB_PASS \
    --admin_email=eyupgulerrr@gmail.com;

fi

exec "$@"