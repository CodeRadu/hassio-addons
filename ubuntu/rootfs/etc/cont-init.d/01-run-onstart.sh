#! /usr/bin/with-contenv bashio
# shellcheck shell=bash

CONFIG="/config/ubuntu"

if [ -f "$CONFIG/onstart.sh" ]; then
  chmod +x "$CONFIG/onstart.sh"
  "$CONFIG/onstart.sh"
fi