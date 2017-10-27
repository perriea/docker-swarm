#!/bin/sh

sed -i "s/define('DB_NAME', null);/define('DB_NAME', '${MYSQL_USER_DB}');/" /srv/app/wordpress/wp-config.php
sed -i "s/define('DB_USER', null);/define('DB_USER', '${MYSQL_USER}');/" /srv/app/wordpress/wp-config.php
sed -i "s/define('DB_PASSWORD', null);/define('DB_PASSWORD', '${MYSQL_USER_PWD}');/" /srv/app/wordpress/wp-config.php
sed -i "s/define('DB_HOST', null);/define('DB_HOST', '${MYSQL_HOST}');/" /srv/app/wordpress/wp-config.php

rm /srv/app/wordpress/wp-config-sample.php /srv/app/wordpress/license.txt /srv/app/wordpress/readme.html