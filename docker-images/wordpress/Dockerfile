FROM alpine:3.6

LABEL MAINTAINER="Aurelien PERRIER <perrie_a@etna-alternance.net>"
LABEL APP="wordpress"
LABEL APP_VERSION="4.8.3"
LABEL APP_REPOSITORY="https://github.com/WordPress/WordPress/releases"
LABEL APP_DESCRIPTION="app"

ENV TIMEZONE Europe/Paris
ENV VERSION_WORDPRESS 4.9

# Minimum package installation
RUN apk add --update --no-cache --virtual .build-deps wget unzip

# Work path
WORKDIR /srv/app

# Download & install wordpress
RUN wget --no-check-certificate -q -O wordpress-${VERSION_WORDPRESS}.zip https://wordpress.org/wordpress-${VERSION_WORDPRESS}.zip
RUN unzip -q /srv/app/wordpress-${VERSION_WORDPRESS}.zip -d /srv/app/ && \
        rm /srv/app/wordpress-${VERSION_WORDPRESS}.zip && \
        chmod -R +x /srv/app/wordpress && \
        apk del .build-deps

# Copy of the WordPress configuration file
COPY ./files/wp-config.php /srv/app/wordpress
COPY ./scripts/update.sh /root/update.sh

# Creation of the volume, the code is in
VOLUME ["/srv/app/wordpress"]

ENTRYPOINT [ "sh", "/root/update.sh" ]