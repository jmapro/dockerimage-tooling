FROM alpine:latest

# This hack is widely applied to avoid python printing issues in docker containers.
# See: https://github.com/Docker-Hub-frolvlad/docker-alpine-python3/pull/13
ENV PYTHONUNBUFFERED=1

RUN \
    apk add --update --no-cache curl tar openssl jq pigz python3 && \
    apk add --virtual=build gcc libffi-dev musl-dev openssl-dev make python3-dev && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --no-cache --upgrade pip setuptools wheel && \
    pip3 install --no-cache --upgrade azure-cli && \
    apk del build
