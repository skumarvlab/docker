FROM skumarvlab/alpine:latest-prod

RUN apk add --no-cache python3 && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    rm -r /root/.cache

    WORKDIR /app

    ONBUILD COPY python-requirements.txt /app
    ONBUILD RUN virtualenv /env && /env/bin/pip install -r /app/python-requirements.txt

    CMD ["/bin/bash"]