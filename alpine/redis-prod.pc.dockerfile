FROM skumarvlab/alpine:latest-prod

RUN apk add redis \
    && rm -rf /var/cache/apk/*

WORKDIR /etc/redis

RUN echo "port 6379" > /etc/redis/redis.conf

ONBUILD COPY ./redis.conf /etc/redis/redis.conf

EXPOSE 6379

CMD ["redis-server", "/etc/redis/redis.conf"]