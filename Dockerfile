FROM alpine:3.6
MAINTAINER Shinnosuke Sawada <6warashi9@gmail.com>

ENV HUGO_VERSION 0.31.1
ENV HUGO_BINARY hugo_${HUGO_VERSION}_linux-64bit
RUN apk update && apk upgrade && apk add py-pygments git openssh-client rsync && rm -rf /var/cache/apk/*
ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY}.tar.gz /usr/local/
RUN tar -xf /usr/local/${HUGO_BINARY}.tar.gz -C /usr/local/bin/ && rm /usr/local/${HUGO_BINARY}.tar.gz
