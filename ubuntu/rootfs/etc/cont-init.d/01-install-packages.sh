#! /usr/bin/with-contenv bashio
# shellcheck shell=bash

if [ ! -d /data/packages ]; then
  mkdir -p /data/packages
fi

for package in $(bashio::config "packages"); do
  NAME=$(jq -r '.name' <<< "${package}")
  VERSION=$(jq -r '.version' <<< "${package}")
  pkg install "$NAME" "$VERSION"
done
