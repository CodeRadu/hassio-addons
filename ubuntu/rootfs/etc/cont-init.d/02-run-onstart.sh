#! /usr/bin/with-contenv bashio
# shellcheck shell=bash

CONFIG="/config/ubuntu"

if [ -f "$CONFIG/onstart.sh" ]; then
  cd /data/packages
  for d in */; do
    chmod a+x "$d/onstart.sh"
    bash "$d/onstart.sh"
  done
  chmod +x "$CONFIG/onstart.sh"
  "$CONFIG/onstart.sh"
fi