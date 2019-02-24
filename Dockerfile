FROM alpine:3.9
MAINTAINER Shinnosuke Sawada <6warashi9@gmail.com>

ENV HUGO_VERSION 0.54.0
ENV HUGO_BINARY hugo_${HUGO_VERSION}_linux-64bit
ENV HUB_VERSION 2.9.0
ENV HUB_TGZ hub-linux-amd64-${HUB_VERSION}
RUN apk update && apk upgrade && apk add py-pygments git openssh-client rsync && rm -rf /var/cache/apk/*
ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY}.tar.gz /tmp/
ADD https://github.com/github/hub/releases/download/v${HUB_VERSION}/${HUB_TGZ}.tgz /tmp/
RUN tar -xf /tmp/${HUGO_BINARY}.tar.gz -C /tmp/ hugo && mv /tmp/hugo /usr/local/bin/hugo && rm /tmp/${HUGO_BINARY}.tar.gz && tar -xf /tmp/${HUB_TGZ}.tgz -C /tmp/ ${HUB_TGZ}/bin/hub && mv /tmp/${HUB_TGZ}/bin/hub /usr/local/bin/hub && rm /tmp/${HUB_TGZ}.tgz
