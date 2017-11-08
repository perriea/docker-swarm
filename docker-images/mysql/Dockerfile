FROM alpine:3.6

LABEL MAINTAINER="Aurelien PERRIER <perrie_a@etna-alternance.net>"

ENV TIMEZONE Europe/Paris

# Installing packages (MariaDB & dependencies Fluentd)
RUN apk add --update --no-cache mysql ruby ruby-irb supervisor
RUN apk add --update --no-cache --virtual .build-deps build-base ruby-dev wget

RUN echo 'gem: --no-document' >> /etc/gemrc && \ 
        gem install oj -v 2.18.3 && \
        gem install json -v 2.1.0 && \
        gem install fluentd -v 0.14.22 && \
        gem install fluent-plugin-s3 -v 1.0.0.rc2 && \
        apk del .build-deps

RUN mkdir -p /fluentd/log \
        /fluentd/plugins \
        /var/log/td-agent \
        /var/log/mysql \
        /var/log/telegraf

# Work path
WORKDIR /scripts

RUN addgroup mysql mysql

# Copy of the MySQL startup script
COPY ./scripts/start.sh ./start.sh
RUN chmod +x ./start.sh

COPY ./files/*.conf /root/config/

# Creating the persistent volume
VOLUME [ "/var/lib/mysql" ]

EXPOSE 3306

ENTRYPOINT [ "./start.sh" ]