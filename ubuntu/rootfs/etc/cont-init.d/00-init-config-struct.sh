#! /usr/bin/with-contenv bashio
# shellcheck shell=bash

CONFIG="/config/ubuntu"

if [ ! -d "$CONFIG" ]; then
  mkdir "$CONFIG"
  mkdir "$CONFIG/rootfs"
  mkdir -p "$CONFIG/rootfs/etc/services.d"
  cat > "$CONFIG/onstart.sh" <<- EOF
#! /usr/bin/with-contenv bashio
# shellcheck shell=bash

# This will run on addon startup
EOF
fi