FROM ghcr.io/hassio-addons/ubuntu-base/armv7:7.2.0 AS base-armv7
FROM ghcr.io/hassio-addons/ubuntu-base/amd64:7.2.0 AS base-amd64
FROM ghcr.io/hassio-addons/ubuntu-base/aarch64:7.2.0 AS base-arm64

WORKDIR /app

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -

RUN apt update
RUN apt upgrade -y
RUN apt install -y --no-install-recommends \
  nginx-light \
  nodejs
RUN npm i -g yarn

COPY rootfs /
COPY editor/package*.json .
COPY editor/yarn.lock .
RUN mkdir frontend
COPY editor/frontend/package*.json frontend
COPY editor/frontend/yarn.lock frontend

RUN yarn
WORKDIR /app/frontend
RUN yarn

WORKDIR /app
COPY editor .

WORKDIR /app/frontend
RUN yarn build

RUN unlink /etc/nginx/sites-enabled/default
RUN nginx -t

