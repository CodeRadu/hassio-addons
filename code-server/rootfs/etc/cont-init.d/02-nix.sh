#! /usr/bin/bash

mkdir /data/nix
mkdir /nix

mount --bind /data/nix /nix

if [ ! -d /nix/store ]; then
  HOME=/root NIX_IGNORE_SYMLINK_STORE=1 sh <(curl -L https://nixos.org/nix/install) --daemon
fi

useradd nixbld1 --system
groupadd nixbld
usermod -aG nixbld nixbld1