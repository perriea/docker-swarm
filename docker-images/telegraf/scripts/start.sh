#!/bin/sh

echo "Configuration Telegraf MySQL ..."
sed -i "s/user:passwd/$MYSQL_USER_TELEGRAF:$MYSQL_USER_TELEGRAF_PWD/" /root/telegraf.conf

echo "Starting Telegraf ..."
./telegraf/telegraf --config telegraf.conf