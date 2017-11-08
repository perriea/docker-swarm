FROM alpine:3.6

LABEL MAINTAINER="Aurelien PERRIER <perrie_a@etna-alternance.net>"

ENV TIMEZONE Europe/Paris
ENV APACHE_SERVER_NAME tartempion.com

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
        php7-zlib \
        mysql-client \
        ruby \
        ruby-irb \
        supervisor

# Installing Fluentd & dependencies

RUN apk add --no-cache --virtual .build-deps \
        build-base \
        ruby-dev \
        wget

RUN echo 'gem: --no-document' >> /etc/gemrc && \ 
        gem install oj -v 2.18.3 && \
        gem install json -v 2.1.0 && \
        gem install fluentd -v 0.14.22 && \
        gem install fluent-plugin-s3 -v 1.0.0.rc2 && \
        apk del .build-deps

RUN mkdir -p /fluentd/log \
        /fluentd/plugins \
        /var/log/td-agent \
        /var/log/telegraf \
        /var/log/httpd \
        /run/apache2 

# Work path
WORKDIR /scripts

# Copy of the HTTPD startup script
COPY ./scripts/start.sh ./start.sh
RUN chmod +x ./start.sh

COPY ./files/*.conf /root/config/

EXPOSE 80

ENTRYPOINT [ "./start.sh" ]