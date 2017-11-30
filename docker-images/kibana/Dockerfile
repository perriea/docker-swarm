FROM alpine:3.6

LABEL MAINTAINER="Aurelien PERRIER <perrie_a@etna-alternance.net>"
LABEL APP="kibana"
LABEL APP_VERSION="6.0.0"
LABEL APP_REPOSITORY="https://github.com/influxdata/kapacitor/releases"
LABEL APP_DESCRIPTION="logging"

ENV TIMEZONE Europe/Paris
ENV VERSION 6.0.0
ENV PATH /usr/share/kibana/bin:$PATH

# Install dependencies && tmp
RUN apk add --no-cache bash nodejs su-exec \
  && apk add --no-cache -t .build-deps wget ca-certificates gnupg openssl

# Download & install binary
RUN echo "===> Install Kibana..." \
  && cd /tmp \
  && wget --no-check-certificate -q -O kibana.tar.gz "https://artifacts.elastic.co/downloads/kibana/kibana-${VERSION}-linux-x86_64.tar.gz" \
  && tar -xf kibana.tar.gz \
  && mv kibana-$VERSION-linux-x86_64 /usr/share/kibana \
  && adduser -D -h /usr/share/kibana kibana

# Create paths & uninstall tmp dependencies
RUN echo "===> Configure Kibana..." \
  && sed -ri "s!^(\#\s*)?(server\.host:).*!\2 '0.0.0.0'!" /usr/share/kibana/config/kibana.yml \
  && grep -q "^server\.host: '0.0.0.0'\$" /usr/share/kibana/config/kibana.yml \
  && sed -ri "s!^(\#\s*)?(elasticsearch\.url:).*!\2 'http://elasticsearch:9200'!" /usr/share/kibana/config/kibana.yml \
  && grep -q "^elasticsearch\.url: 'http://elasticsearch:9200'\$" /usr/share/kibana/config/kibana.yml \
  && sed -i "s|NODE=\"${DIR}/node/bin/node\"|NODE=\"/usr/bin/node\"|g" /usr/share/kibana/bin/kibana-plugin \
  && sed -i "s|NODE=\"${DIR}/node/bin/node\"|NODE=\"/usr/bin/node\"|g" /usr/share/kibana/bin/kibana \
  && rm -rf /usr/share/kibana/node /tmp/* \
  && chown -R kibana:kibana /usr/share/kibana \
  && apk del --purge .build-deps

COPY ./scripts/start.sh /

WORKDIR /usr/share/kibana

VOLUME [ "/usr/share/kibana" ]

EXPOSE 5601

ENTRYPOINT ["/start.sh"]
CMD ["kibana"]