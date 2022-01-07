#!/usr/bin/bash

mkdir -p /root/.local/share
mkdir -p /root/.config
mkdir -p /config/code-server/local
mkdir -p /config/code-server/config
mkdir -p /config/code-server/data

cp /code-server.yaml /config/code-server/config/config.yaml
echo This is the only folder that will be saved on the home assistant disk. > /config/code-server/data/readme.txt

ln -s /config/code-server/local /root/.local/share/code-server
ln -s /config/code-server/config /root/.config/code-server
ln -s /config/code-server/data /root/data

code-server