FROM alpine:3.6

ENV CHRONOGRAF_VERSION 1.3.10.0

RUN echo 'hosts: files dns' >> /etc/nsswitch.conf
RUN apk add --no-cache ca-certificates && \
    update-ca-certificates

RUN set -ex && \
    apk add --no-cache --virtual .build-deps wget gnupg tar && \
    gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "05CE15085FC09D18E99EFB22684A14CF2582E0C5" || gpg --keyserver pgp.mit.edu --recv-keys "05CE15085FC09D18E99EFB22684A14CF2582E0C5" || gpg --keyserver keyserver.pgp.com --recv-keys "05CE15085FC09D18E99EFB22684A14CF2582E0C5" && \
    wget -q https://dl.influxdata.com/chronograf/releases/chronograf-${CHRONOGRAF_VERSION}-static_linux_amd64.tar.gz.asc && \
    wget -q https://dl.influxdata.com/chronograf/releases/chronograf-${CHRONOGRAF_VERSION}-static_linux_amd64.tar.gz && \
    gpg --batch --verify chronograf-${CHRONOGRAF_VERSION}-static_linux_amd64.tar.gz.asc chronograf-${CHRONOGRAF_VERSION}-static_linux_amd64.tar.gz && \
    mkdir -p /usr/src && \
    tar -C /usr/src -xzf chronograf-${CHRONOGRAF_VERSION}-static_linux_amd64.tar.gz && \
    rm -f /usr/src/chronograf-*/chronograf.conf && \
    chmod +x /usr/src/chronograf-*/* && \
    cp -a /usr/src/chronograf-*/* /usr/bin/ && \
    rm -rf *.tar.gz* /usr/src /root/.gnupg && \
    apk del .build-deps

EXPOSE 8888

VOLUME /var/lib/chronograf

ENTRYPOINT ["chronograf"]