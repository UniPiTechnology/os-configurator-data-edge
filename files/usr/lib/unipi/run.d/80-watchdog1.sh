#!/bin/sh

[ -f /etc/bootcmd.d/Makefile ] || exit 0

if [ "$HAS_WATCHDOG1" = "1" ]; then
    SKIP_BUILD=1 make -s -C /etc/bootcmd.d use-watchdog1
else
    SKIP_BUILD=1 make -s -C /etc/bootcmd.d unuse-watchdog1
fi
