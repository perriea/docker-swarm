FROM alpine:3.6

LABEL MAINTAINER="Aurelien PERRIER <perrie_a@etna-alternance.net>"

ENV INFLUXDB_VERSION 1.3.7

RUN apk add --no-cache --virtual .build-deps wget gnupg tar ca-certificates && \
        update-ca-certificates

RUN gpg --keyserver http://ha.pool.sks-keyservers.net --recv-keys 05CE15085FC09D18E99EFB22684A14CF2582E0C5
    
RUN wget -q https://dl.influxdata.com/influxdb/releases/influxdb-${INFLUXDB_VERSION}-static_linux_amd64.tar.gz.asc && \
        wget -q https://dl.influxdata.com/influxdb/releases/influxdb-${INFLUXDB_VERSION}-static_linux_amd64.tar.gz && \
        gpg --batch --verify influxdb-${INFLUXDB_VERSION}-static_linux_amd64.tar.gz.asc influxdb-${INFLUXDB_VERSION}-static_linux_amd64.tar.gz
    
RUN mkdir -p /usr/src /etc/influxdb && \
        tar -C /usr/src -xzf influxdb-${INFLUXDB_VERSION}-static_linux_amd64.tar.gz && \
        rm -f /usr/src/influxdb-*/influxdb.conf && \
        chmod +x /usr/src/influxdb-*/* && \
        cp -a /usr/src/influxdb-*/* /usr/bin/ && \
        rm -rf *.tar.gz* /usr/src /root/.gnupg && \
        apk del .build-deps

COPY ./files/influxdb.conf /etc/influxdb

VOLUME [ "/var/lib/influxdb" ]

EXPOSE 8125/udp 8092/udp 8086 8083

ENTRYPOINT [ "influxd" ]