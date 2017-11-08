FROM alpine:3.6

LABEL MAINTAINER="Aurelien PERRIER <perrie_a@etna-alternance.net>"

ENV TIMEZONE Europe/Paris
ENV CHRONOGRAF_VERSION 1.3.10.0

# Install dependencies
RUN apk add --no-cache --virtual .build-deps wget tar

# Download & install Chronograf
RUN wget --no-check-certificate -q https://dl.influxdata.com/chronograf/releases/chronograf-${CHRONOGRAF_VERSION}-static_linux_amd64.tar.gz
RUN mkdir -p /usr/src && \
    tar -C /usr/src -xzf chronograf-${CHRONOGRAF_VERSION}-static_linux_amd64.tar.gz && \
    rm -f /usr/src/chronograf-*/chronograf.conf && \
    chmod +x /usr/src/chronograf-*/* && \
    cp -a /usr/src/chronograf-*/* /usr/bin/ && \
    rm -rf *.tar.gz* /usr/src && \
    apk del .build-deps

EXPOSE 8888

VOLUME /var/lib/chronograf

ENTRYPOINT ["chronograf"]