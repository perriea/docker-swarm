#! /bin/sh

# Create bucket fluentd
mkdir -p /data/fluentd
chmod 755 /data/fluentd
chown -R minio:minio /data

/usr/bin/gosu minio /usr/bin/minio server /data