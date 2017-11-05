FROM alpine:3.6

LABEL MAINTAINER="Aurelien PERRIER <perrie_a@etna-alternance.net>"

ENV TIMEZONE Europe/Paris
ENV VERSION_WORDPRESS 4.8.3

# Minimum package installation
RUN apk --update add --no-cache wget unzip

# Work path
WORKDIR /srv/app

# Download & install wordpress
RUN wget --no-check-certificate https://wordpress.org/wordpress-${VERSION_WORDPRESS}.zip
RUN unzip /srv/app/wordpress-${VERSION_WORDPRESS}.zip -d /srv/app/ && \
        rm /srv/app/wordpress-${VERSION_WORDPRESS}.zip && \
        chmod -R +x /srv/app/wordpress

# Copy of the WordPress configuration file
COPY ./files/wp-config.php /srv/app/wordpress
COPY ./scripts/update.sh /root/update.sh

# Creation of the volume, the code is in
VOLUME ["/srv/app/wordpress"]

ENTRYPOINT [ "sh", "/root/update.sh" ]