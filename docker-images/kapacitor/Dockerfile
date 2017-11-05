FROM alpine:3.6

LABEL MAINTAINER="Aurelien PERRIER <perrie_a@etna-alternance.net>"

ENV KAPACITOR_VERSION 1.3.3
ENV KAPACITOR_HOSTNAME=${KAPACITOR_HOSTNAME:-$HOSTNAME}

RUN apk add --no-cache --virtual .build-deps wget gnupg tar ca-certificates && \
        update-ca-certificates

RUN set -ex && \
    apk add --no-cache --virtual .build-deps wget gnupg tar && \
    gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "05CE15085FC09D18E99EFB22684A14CF2582E0C5" || gpg --keyserver pgp.mit.edu --recv-keys "05CE15085FC09D18E99EFB22684A14CF2582E0C5" || gpg --keyserver keyserver.pgp.com --recv-keys "05CE15085FC09D18E99EFB22684A14CF2582E0C5" && \
    wget -q https://dl.influxdata.com/kapacitor/releases/kapacitor-${KAPACITOR_VERSION}-static_linux_amd64.tar.gz.asc && \
    wget -q https://dl.influxdata.com/kapacitor/releases/kapacitor-${KAPACITOR_VERSION}-static_linux_amd64.tar.gz && \
    gpg --batch --verify kapacitor-${KAPACITOR_VERSION}-static_linux_amd64.tar.gz.asc kapacitor-${KAPACITOR_VERSION}-static_linux_amd64.tar.gz && \
    mkdir -p /usr/src && \
    tar -C /usr/src -xzf kapacitor-${KAPACITOR_VERSION}-static_linux_amd64.tar.gz && \
    rm -f /usr/src/kapacitor-*/kapacitor.conf && \
    chmod +x /usr/src/kapacitor-*/* && \
    cp -a /usr/src/kapacitor-*/* /usr/bin/ && \
    rm -rf *.tar.gz* /usr/src /root/.gnupg && \
    apk del .build-deps

WORKDIR /root/config
COPY ./files/kapacitor.conf ./kapacitor.conf
    
EXPOSE 9092

VOLUME /var/lib/kapacitor

ENTRYPOINT ["kapacitord", "-config", "/root/config/kapacitor.conf", "-pidfile", "/root/kapicitor.pid", "-log-file", "/var/log/kapicitor/kapacitor.log"]