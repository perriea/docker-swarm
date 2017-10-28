FROM alpine:3.6

LABEL MAINTAINER="Aurelien PERRIER <perrie_a@etna-alternance.net>"

ENV TELEGRAF_VERSION 1.4.3
ENV INFLUXDB_HOST influxdb

RUN apk --update add --no-cache iputils ca-certificates && update-ca-certificates
RUN apk add --no-cache --virtual .build-deps wget gnupg tar

RUN gpg --keyserver http://ha.pool.sks-keyservers.net --recv-keys 05CE15085FC09D18E99EFB22684A14CF2582E0C5

RUN wget -q https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_VERSION}-static_linux_amd64.tar.gz.asc && \
        wget -q https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_VERSION}-static_linux_amd64.tar.gz && \
        gpg --batch --verify telegraf-${TELEGRAF_VERSION}-static_linux_amd64.tar.gz.asc telegraf-${TELEGRAF_VERSION}-static_linux_amd64.tar.gz

RUN mkdir -p /srv/app && \
        tar -C /srv/app -xzf telegraf-${TELEGRAF_VERSION}-static_linux_amd64.tar.gz && \
        chmod +x /srv/app/telegraf/* && \
        rm /srv/app/telegraf/telegraf.conf && \
        rm -rf *.tar.gz* /root/.gnupg && \
        apk del .build-deps

COPY ./files/* /srv/app/telegraf/
RUN mkdir -p /srv/app/telegraf/telegraf.d

VOLUME ["/srv/app/"]
