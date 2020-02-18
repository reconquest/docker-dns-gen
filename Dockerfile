FROM alpine:latest

LABEL maintainer="Reconquest Team <we@reconquest.io>"

RUN apk --no-cache add \
    bind \
    gettext \
    openssl

ENV DOCKER_GEN_VERSION 0.7.4
ENV DOCKER_HOST unix:///var/run/docker.sock

RUN wget -qO- https://github.com/jwilder/docker-gen/releases/download/$DOCKER_GEN_VERSION/docker-gen-alpine-linux-amd64-$DOCKER_GEN_VERSION.tar.gz | tar xvz -C /usr/local/bin
COPY docker-files/. /

VOLUME /var/run/docker.sock

EXPOSE 5353/udp

ENV GATEWAY=172.17.0.1

ENTRYPOINT ["entrypoint"]
