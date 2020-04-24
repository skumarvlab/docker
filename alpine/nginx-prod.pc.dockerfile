FROM skumarvlab/alpine:latest-prod

RUN apk add nginx \
    && rm -rf /var/cache/apk/*

WORKDIR /etc/nginx

EXPOSE 80 443

CMD ["nginx", "-g", "pid /var/run/nginx.pid; daemon off;"]