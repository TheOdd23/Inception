#!/bin/bash -x
if [ ! -f "/var/www/html/wp-config.php" ]; then
    echo "Waiting for database"
    sleep 5
    if [[ "${WP_ADMIN}" == *admin* || "${WP_ADMIN}" == *Admin* ]]; then
        echo "Admin username or password cannot contain 'admin'. Please choose a different username or password."
        exit 1
    else
        echo "Configurating wordpress"
        wp core download --allow-root --path="/var/www/html"
        wp config create --allow-root \
            --dbname=$DB_NAME \
            --dbuser=$DB_USER \
            --dbpass=$DB_PASSWORD \
            --dbhost=$DB_HOST \
            --path='/var/www/html'
        wp core install --allow-root --url="${DOMAIN_NAME}" --title="${WP_TITLE}" --admin_user="${WP_ADMIN}" --admin_password="${WP_ADMIN_PWD}" --admin_email="${WP_ADMIN_EMAIL}"
        wp user create --allow-root "${WP_USER}" "${WP_USER_EMAIL}" --user_pass="${WP_USER_PWD}"
        echo "Wordpress configuration: OK!"
    fi
fi

if [ ! -e "/run/php/" ]; then
    mkdir -p /run/php/
fi

exec "$@"
