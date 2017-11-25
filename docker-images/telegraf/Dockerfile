FROM alpine:3.6

LABEL MAINTAINER="Aurelien PERRIER <perrie_a@etna-alternance.net>"

ENV TIMEZONE Europe/Paris
ENV TELEGRAF_VERSION 1.4.3
ENV INFLUXDB_HOST influxdb

# Installing dependencies
RUN apk --update add --no-cache --virtual .build-deps wget tar

WORKDIR /root

# Installing binaries
RUN wget --no-check-certificate -q https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_VERSION}-static_linux_amd64.tar.gz

RUN mkdir -p /srv/app && \
        tar -C . -xzf telegraf-${TELEGRAF_VERSION}-static_linux_amd64.tar.gz && \
        chmod +x telegraf/* && \
        rm telegraf/telegraf.conf && \
        rm -rf *.tar.gz* /root/.gnupg && \
        apk del .build-deps

COPY ./files/telegraf.conf telegraf.conf

COPY ./scripts/start.sh start.sh

ENTRYPOINT [ "./start.sh" ]