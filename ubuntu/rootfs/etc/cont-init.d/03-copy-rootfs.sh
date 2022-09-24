#! /usr/bin/with-contenv bashio
# shellcheck shell=bash

CONFIG="/config/ubuntu"

if [ -d "$CONFIG/rootfs" ]; then
  cp -a "$CONFIG/rootfs/." /
fi