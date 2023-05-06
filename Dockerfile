FROM node:20.1.0-alpine3.17

LABEL maintainer="Valentino Lauciani <valentino.lauciani@ingv.it>"

ENV DEBIAN_FRONTEND=noninteractive
ENV INITRD No
ENV FAKE_CHROOT 1
ARG OPENAI_KEY=your_openapai_key

RUN apk update \
  && apk add \
    git \
    vim 

RUN npm install -g aicommits \
  && npm update -g aicommits \
  && aicommits config set OPENAI_KEY=${OPENAI_KEY}
