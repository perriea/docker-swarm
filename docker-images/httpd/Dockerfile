FROM alpine:3.6

LABEL MAINTAINER="Aurelien PERRIER <perrie_a@etna-alternance.net>"
LABEL APP="httpd"
LABEL APP_VERSION="2.4.29-r1"
LABEL APP_REPOSITORY="https://pkgs.alpinelinux.org/package/edge/main/aarch64/apache2"
LABEL APP_DESCRIPTION="app"

ENV TIMEZONE Europe/Paris

# Installing dependencies Wordpress & Fluentd
RUN apk --update add --no-cache apache2 \
        php7 \
        php7-apache2 \
        php7-openssl \
        php7-xml \
        php7-pdo \
        php7-mcrypt \
        php7-session \
        php7-mysqli \
        php7-zlib

# Installing dependencies
RUN apk add --no-cache --virtual .build-deps wget
RUN mkdir -p /run/apache2 /run/httpd

# Work path
WORKDIR /scripts

# Copy of the HTTPD startup script
COPY ./scripts/start.sh ./start.sh
RUN chmod +x ./start.sh

EXPOSE 80

ENTRYPOINT [ "./start.sh" ]