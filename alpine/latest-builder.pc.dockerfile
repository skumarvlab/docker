FROM alpine:latest

RUN apk update && \
apk upgrade && \
apk add --update bash build-base linux-headers \
automake autoconf \
openssl openssl-dev openssh curl ca-certificates \
pcre pcre-dev \
zlib zlib-dev \
git wget nano && \
rm -rf /var/cache/apk/*

CMD ["/bin/bash"]