#! /usr/bin/with-contenv bashio
# shellcheck shell=bash

mkdir -p /data/server || true
mkdir -p /config/mc/config || true
rm -rf /mcpanel/config

chown -R server:server /mcpanel
chown -R server:server /data
ln -s /data/server /mcpanel/server || true
ln -s /config/mc/config /mcpanel/ || true
