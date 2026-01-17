#!/bin/sh

[ -f /etc/bootcmd.d/Makefile ] || exit 0

if ! [ "$VERBOSE" = "1" ]; then
    exec >/dev/null
fi

make -C /etc/bootcmd.d force
