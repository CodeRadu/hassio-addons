#! /usr/bin/with-contenv bashio
# shellcheck shell=bash
bashio::log.info "For ssh and scp access use 'ssh server@<homeassistant ip> -p <port in config>' and password set in addon configuration"
password=$(bashio::config 'ssh_password')
echo "server:$password" | chpasswd