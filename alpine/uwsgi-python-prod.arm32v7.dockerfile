FROM skumarvlab/alpine.arm32v7:latest-prod

RUN apk add --no-cache  uwsgi uwsgi-python3

WORKDIR /app

EXPOSE 80

CMD ["/usr/sbin/uwsgi", "--http-socket", ":80", "--plugin", "python3", "--module", "wsgi:app"]