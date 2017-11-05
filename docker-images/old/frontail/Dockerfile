FROM alpine:3.6

RUN apk --no-cache --update add nodejs nodejs-npm git
RUN npm i -g frontail

EXPOSE 9001 123

ENTRYPOINT ["frontail", "/var/log/syslog/*"]