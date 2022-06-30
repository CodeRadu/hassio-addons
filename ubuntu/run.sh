#! /bin/bash

docker build -t test .
docker run --rm -v /workspaces/hassio-addons/ubuntu/conf:/config -p 22:8022 test