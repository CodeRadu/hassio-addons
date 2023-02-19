#!/usr/bin/bash

mkdir /data

mkdir /data/etc

ln -s /data/etc/bashrc /etc/bashrc
ln -s /data/etc/zshrc /etc/zshrc
ln -s /data/etc/zshrc /etc/zshrc

touch /data/zsh_history
ln -s /data/zsh_history /root/zsh_history

mkdir /etc/profile.d
ln -s /data/etc/profile.d /etc/profile.d
mkdir /etc/zsh
ln -s /data/etc/zsh /etc/zsh

chmod 644 /etc/passwd /etc/shadow /etc/group