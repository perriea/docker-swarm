FROM alpine:3.6

LABEL MAINTAINER="Aurelien PERRIER <perrie_a@etna-alternance.net>"

ENV TIMEZONE Europe/Paris

WORKDIR /root

# Updating alpine certificates (min wget)
RUN apk add --update ca-certificates wget && \
        update-ca-certificates

# Downloading packages
RUN wget -O /usr/bin/minio https://dl.minio.io/server/minio/release/linux-amd64/minio
RUN wget -O /usr/bin/gosu https://github.com/tianon/gosu/releases/download/1.10/gosu-amd64
COPY ./scripts/start.sh .

# Updating rights
RUN chmod +x /usr/bin/minio && \ 
    chmod +x /usr/bin/gosu && \
    chmod +x start.sh && \
    addgroup minio && \
    adduser -s /bin/false -G minio -S -D minio

VOLUME [ "/data" ]

EXPOSE 9000

ENTRYPOINT  ["./start.sh"]