FROM alpine:3.6

LABEL MAINTAINER="Aurelien PERRIER <perrie_a@etna-alternance.net>"
LABEL APP="minio"
LABEL APP_VERSION="latest"
LABEL APP_REPOSITORY="https://github.com/minio/minio/releases"
LABEL APP_DESCRIPTION="storage"

ENV TIMEZONE Europe/Paris
ENV GOSU_VERSION 1.10

# Updating alpine certificates (min wget)
RUN apk add --update --virtual .build-deps wget

# Downloading packages
RUN wget --no-check-certificate -q -O /usr/bin/minio https://dl.minio.io/server/minio/release/linux-amd64/minio
RUN wget --no-check-certificate -q -O /usr/bin/gosu https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-amd64
COPY ./scripts/start.sh .

# Updating rights
RUN chmod +x /usr/bin/minio && \ 
    chmod +x /usr/bin/gosu && \
    chmod +x start.sh && \
    addgroup minio && \
    adduser -s /bin/false -G minio -S -D minio && \
    apk del .build-deps

VOLUME [ "/data" ]

EXPOSE 9000

ENTRYPOINT  ["./start.sh"]