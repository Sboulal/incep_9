#!bin/sh

# This script is used to create the database and the user for the database.
mysqld_safe & sleep 5

mariadb -u root <<EOF
CREATE DATABASE $DB_NAME;
CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER@'%';
FLUSH PRIVILEGES;
EOF

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIA_DB_ROOT_PASSWORD';"
mysqladmin -u root -p $MARIA_DB_ROOT_PASSWORD shutdown

mysqld_safe