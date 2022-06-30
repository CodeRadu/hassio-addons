#! /usr/bin/bash

if [ -f /config/ubuntu/init.sh ]; then
  chmod +x /config/ubuntu/init.sh
  /config/ubuntu/init.sh
fi