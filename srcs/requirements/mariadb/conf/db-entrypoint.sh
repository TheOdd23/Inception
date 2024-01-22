#!/bin/bash -x

if [ ! -f "/var/lib/mysql/is_initialized" ]; then
    echo "Initializing MariaDB"
    mysql_install_db --basedir=/usr --user=mysql --datadir=/var/lib/mysql;
    
    echo "USE mysql;" > /tmp/init.sql
    echo "FLUSH PRIVILEGES;" >> /tmp/init.sql
	echo "CREATE DATABASE IF NOT EXISTS ${DB_NAME};" >> /tmp/init.sql
    
    echo "CREATE USER ${DB_USER}@'%' IDENTIFIED BY '${DB_PASSWORD}';" >> /tmp/init.sql
    echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOTPWD}';" >> /tmp/init.sql
    echo "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO ${DB_USER}@'%';" >> /tmp/init.sql
    echo "ALTER DATABASE ${DB_NAME} CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;" >> /tmp/init.sql
    
    echo "Running init sql"
    #cat /tmp/init.sql
    mysqld  --bootstrap < /tmp/init.sql || exit 255 
    echo "Database init: OK!"
    touch /var/lib/mysql/is_initialized
fi

exec mysqld