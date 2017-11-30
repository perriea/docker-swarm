FROM alpine:3.6

LABEL MAINTAINER="Aurelien PERRIER <perrie_a@etna-alternance.net>"
LABEL APP="influxdb"
LABEL APP_VERSION="1.3.7"
LABEL APP_REPOSITORY="https://github.com/influxdata/influxdb/releases"
LABEL APP_DESCRIPTION="logging"

ENV TIMEZONE Europe/Paris
ENV INFLUXDB_VERSION 1.3.7

# Installing packages
RUN apk add --no-cache --virtual .build-deps wget tar

# Downloading binaries
RUN wget --no-check-certificate -q https://dl.influxdata.com/influxdb/releases/influxdb-${INFLUXDB_VERSION}-static_linux_amd64.tar.gz

# Installing binaries
RUN mkdir -p /usr/src /etc/influxdb && \
        tar -C /usr/src -xzf influxdb-${INFLUXDB_VERSION}-static_linux_amd64.tar.gz && \
        chmod +x /usr/src/influxdb-*/* && \
        cp -a /usr/src/influxdb-*/* /usr/bin/ && \
        rm -rf *.tar.gz* /usr/src /root/.gnupg && \
        apk del .build-deps

COPY ./files/influxdb.conf /etc/influxdb

VOLUME [ "/var/lib/influxdb" ]

EXPOSE 8086 

ENTRYPOINT [ "influxd", "-config", "/etc/influxdb/influxdb.conf" ]