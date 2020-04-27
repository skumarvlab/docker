FROM skumarvlab/alpine.arm32v7:latest-prod

RUN apk add --no-cache python3 && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools virtualenv && \
    rm -r /root/.cache

WORKDIR /app

CMD ["/bin/bash"]