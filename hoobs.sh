#!/bin/bash
set -e
EXIT_CODE=0
USER=root /usr/bin/hbs --verbose --debug --container install -p $PORT ||  EXIT_CODE=$?
echo $EXIT_CODE
mkdir -p /etc/systemd/system/multi-user.target.wants
ln -s /etc/systemd/system/hoobsd.service /etc/systemd/system/multi-user.target.wants/hoobsd.service
exec /lib/systemd/systemd

/sbin/reboot
