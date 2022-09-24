#! /usr/bin/with-contenv bashio
# shellcheck shell=bash

REPO="https://raw.githubusercontent.com/coderadu/hassio-ubuntu-packages/main"

if [ ! -d /data/packages ]; then
  mkdir -p /data/packages
fi

for package in $(bashio::config "packages"); do
  NAME=$(jq -r '.name' <<< "${package}")
  VERSION=$(jq -r '.version' <<< "${package}")
  if [ "$VERSION" == "latest" ]; then
    VERSION=$(curl -o- "$REPO/$NAME/latest")
  fi
  if [ -d "/data/packages/$NAME" ]; then
    INSTALLED_VERSION=$(cat "/data/packages/$NAME/pkg_version") || "0"
  else
    INSTALLED_VERSION="0"
  fi
  if [ ! "$VERSION" == "$INSTALLED_VERSION" ]; then
    rm -rf "/data/packages/$NAME"
    bashio::log.info "Install $NAME version $VERSION"
    mkdir -p "/data/packages/$NAME"
    wget "$REPO/$NAME/$NAME-$VERSION.tar" -O /tmp/package.tar
    tar -xf /tmp/package.tar -C "/data/packages/$NAME"
    rm /tmp/package.tar
    echo "$VERSION" > "/data/packages/$NAME/pkg_version"
    bash "/data/packages/$NAME/postinstall.sh"
    bashio::log.info "$NAME successfully installed"
  fi
done
