#!/bin/sh

mkdir -p "${DESTDIR}/etc/systemd/network"
ln -sf /dev/null "${DESTDIR}/etc/systemd/network/99-default.link"
ln -sf /dev/null "${DESTDIR}/etc/systemd/network/73-usb-net-by-mac.link"
