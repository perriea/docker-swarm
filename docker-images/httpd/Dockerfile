FROM alpine:3.6

LABEL maintainer="Aurelien PERRIER <perrie_a@etna-alternance.net>"

ENV TIMEZONE Europe/Paris
ENV APACHE_SERVER_NAME tartempion.com

# Installing PHP7 packages
RUN apk --update add --no-cache apache2 \
        php7 \
        php7-apache2 \
        php7-openssl \
        php7-xml \
        php7-pdo \
        php7-mcrypt \
        php7-session \
        php7-mysqli \
        php7-zlib \
        mysql-client \
        supervisor

RUN mkdir -p /run/apache2

# Work path
WORKDIR /scripts

# Copy of the HTTPD startup script
COPY ./scripts/start.sh ./start.sh
RUN chmod +x ./start.sh

COPY ./files/supervisord.conf /root/config/supervisord.conf
COPY ./files/telegraf.conf /root/config/telegraf.conf

VOLUME [ "/var/log/httpd" ]

EXPOSE 80

ENTRYPOINT [ "./start.sh" ]