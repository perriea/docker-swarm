FROM alpine:3.6

RUN apk --update add ca-certificates ruby ruby-io-console ruby-bundler ruby-dev ruby-irb ruby-rdoc build-base openssl

RUN gem install oj -v 2.18.3 --no-ri --no-rdoc
RUN gem install json -v 2.1.0 --no-ri --no-rdoc
RUN gem install fluentd -v 0.14.22 --no-ri --no-rdoc

# RUN fluent-gem update && \
#     fluent-gem install fluent-plugin-elasticsearch

WORKDIR /fluent

RUN mkdir -p /fluent/log /fluent/etc /fluent/plugin

COPY ./files/fluent.conf fluent.conf

EXPOSE 24224 5140