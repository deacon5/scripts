#!/bin/bash

grep "disable_vmware_customization: false" /etc/cloud/cloud.cfg > /dev/null 2>&1
if [ $? -eq 1 ]; then
    echo "disable_vmware_customization: false" >> /etc/cloud/cloud.cfg
fi

rm -rf /etc/cloud/cloud.cfg.d/99-installer.cfg
rm -rf /etc/cloud/cloud.cfg.d/subiquity-disable-cloudinit-networking.cfg

/usr/bin/cloud-init clean --logs
shutdown -h now
