#!/bin/bash
set -e
EXIT_CODE=0
USER=root /usr/bin/hbs --verbose --debug install -p $PORT ||  EXIT_CODE=$?
echo "Install error code: ${EXIT_CODE}"
echo "HOOBS cli version $(/usr/bin/hbs --version)"

# same as systemctl --enable hoobsd
mkdir -p /etc/systemd/system/multi-user.target.wants
ln -sf /etc/systemd/system/hoobsd.service /etc/systemd/system/multi-user.target.wants/hoobsd.service

# exec does not fork to a child pid so we're #1!
exec /lib/systemd/systemd

