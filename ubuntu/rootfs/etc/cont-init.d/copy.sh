#! /usr/bin/bash

mkdir -p /config/ubuntu/rootfs
mkdir -p /config/ubuntu/rootfs/etc/cont-init.d
mkdir -p /config/ubuntu/rootfs/etc/services.d

if [ ! -f /config/ubuntu/init.sh ]; then
cat > /config/ubuntu/init.sh <<- EOF
#!/usr/bin/bash

echo This is an container initialization script
echo Edit this in /config/ubuntu/init.sh

EOF
fi

cp -r /config/ubuntu/rootfs/* /
chmod -R +x /etc/cont-init.d
chmod -R +x /etc/services.d