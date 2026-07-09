FROM node:20.1.0-alpine3.17

LABEL maintainer="Valentino Lauciani <valentino.lauciani@ingv.it>"

ENV DEBIAN_FRONTEND=noninteractive
ENV INITRD=No
ENV FAKE_CHROOT=1

RUN apk update \
    && apk add \
    git \
    vim

RUN npm install -g aicommits \
    && npm update -g aicommits

# Configuration is supplied at run time (see entrypoint.sh), so no API key is
# baked into the image.
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
