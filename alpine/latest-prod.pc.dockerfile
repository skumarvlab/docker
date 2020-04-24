FROM alpine:latest

RUN apk update && \
apk upgrade && \
apk --update add bash nano && \
rm -rf /var/cache/apk/*

CMD ["/bin/bash"]