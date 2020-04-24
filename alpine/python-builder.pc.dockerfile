FROM skumarvlab/alpine:latest-builder

RUN apk add --no-cache python3 python3-dev  && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    pip3 install virtualenv && \
    rm -r /root/.cache

    WORKDIR /app

    ONBUILD COPY python-requirements.txt /app
    ONBUILD RUN virtualenv /env && /env/bin/pip install -r /app/python-requirements.txt

    CMD ["/bin/bash"]