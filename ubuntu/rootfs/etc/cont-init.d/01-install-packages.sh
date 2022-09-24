#! /usr/bin/with-contenv bashio
# shellcheck shell=bash

REPO="https://raw.githubusercontent.com/coderadu/hassio-ubuntu-packages/main"
INSTALL_SCRIPT="install.sh"

if [ ! -d /data/packages ]; then
  mkdir -p /data/packages
fi

for package in $(bashio::config "packages"); do
  bashio::log.info "Install ${package}"
  URL="$REPO/${package}/$INSTALL_SCRIPT"
  bashio::log.info "Get $URL"
  curl -o- "$URL" | bash
done
