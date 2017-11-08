FROM alpine:3.6

LABEL MAINTAINER="Aurelien PERRIER <perrie_a@etna-alternance.net>"

ENV TIMEZONE Europe/Paris
ENV KAPACITOR_VERSION 1.3.3
ENV KAPACITOR_HOSTNAME=${KAPACITOR_HOSTNAME:-$HOSTNAME}

# Installing packagies
RUN apk add --no-cache --virtual .build-deps wget tar

# Downloading binaries    
RUN wget --no-check-certificate -q https://dl.influxdata.com/kapacitor/releases/kapacitor-${KAPACITOR_VERSION}-static_linux_amd64.tar.gz
    
# Extract archive
RUN tar -C /tmp -xzf kapacitor-${KAPACITOR_VERSION}-static_linux_amd64.tar.gz && \
    rm -f /tmp/kapacitor-*/kapacitor.conf && \
    chmod +x /tmp/kapacitor-*/* && \
    cp -a /tmp/kapacitor-*/* /usr/bin/ && \
    rm -rf /tmp/*.tar.gz* /tmp/kapacitor-* && \
    apk del .build-deps

WORKDIR /root/config
COPY ./files/kapacitor.conf ./kapacitor.conf
    
EXPOSE 9092

VOLUME /var/lib/kapacitor

ENTRYPOINT ["kapacitord", "-config", "/root/config/kapacitor.conf", "-pidfile", "/root/kapicitor.pid", "-log-file", "/var/log/kapicitor/kapacitor.log"]