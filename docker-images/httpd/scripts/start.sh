#!/bin/sh

# Set the timezone. Base image does not contain the setup-timezone script, so an alternate way is used.
if [ "$CONTAINER_TIMEZONE" ]; then
    cp /usr/share/zoneinfo/${CONTAINER_TIMEZONE} /etc/localtime && \
	echo "${CONTAINER_TIMEZONE}" >  /etc/timezone && \
	echo "Container timezone set to: $CONTAINER_TIMEZONE"
fi

# ntpd -s

# Apache server name change
if [ ! -z "$APACHE_SERVER_NAME" ]
	then
		sed -i "s/#ServerName www.example.com:80/ServerName $APACHE_SERVER_NAME:80/" /etc/apache2/httpd.conf
		echo "Changed server name to '$APACHE_SERVER_NAME'..."
	else
		echo "NOTICE: Change 'ServerName' globally and hide server message by setting environment variable >> 'SERVER_NAME=your.server.name' in docker command or docker-compose file"
fi

# Start (ensure apache2 PID not left behind first) to stop auto start crashes if didn't shut down properly
echo "Clearing any old processes..."
rm -f /run/apache2/apache2.pid
rm -f /run/apache2/httpd.pid

echo "Changing values in fluentd ..."
sed -i "s/aws_key_id AZERTY/aws_key_id $MINIO_ACCESS_KEY/" /root/config/fluentd.conf
sed -i "s/aws_sec_key AZERTY/aws_sec_key $MINIO_SECRET_KEY/" /root/config/fluentd.conf

echo "Starting all process ..."
exec supervisord --nodaemon --configuration /root/config/supervisord.conf