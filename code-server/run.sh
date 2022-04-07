#!/usr/bin/bash

/usr/sbin/sshd &

password=$(jq '.userpass' < /data/options.json)
password=$(sed -e 's/^"//' -e 's/"$//' <<<"$password")
echo "user:$password" | chpasswd
echo "The password for 'user' has been set to $password"

mkdir -p /root/.local/share
mkdir -p /root/.config
mkdir -p /config/code-server/local
mkdir -p /config/code-server/config
mkdir -p /config/code-server/data

if ! test -f /config/code-server/config/config.yaml; then
  cp /code-server.yaml /config/code-server/config/config.yaml
fi
echo This is the only folder that will be saved on the home assistant disk. > /config/code-server/data/readme.txt

ln -s /config/code-server/local /root/.local/share/code-server
ln -s /config/code-server/config /root/.config/code-server
ln -s /config/code-server/data /root/data

if ! test -d /config/code-server/local/User; then
  mkdir -p /config/code-server/local/User
fi

if ! test -f /config/code-server/local/User/settings.json; then
  echo "{\"workbench.colorTheme\": \"Default Dark+\",\"terminal.integrated.profiles.linux\": {\"bash\": {\"path\": \"bash\",\"icon\": \"terminal-bash\"},\"zsh\": {\"path\": \"zsh\"}},\"terminal.integrated.defaultProfile.linux\": \"zsh\"}" > /config/code-server/local/User/settings.json
fi

code-server