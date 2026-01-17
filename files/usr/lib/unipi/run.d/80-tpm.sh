#!/bin/sh

[ -f /etc/bootcmd.d/Makefile ] || exit 0

if [ "$HAS_TPM" = "1" ]; then
    SKIP_BUILD=1 make -s -C /etc/bootcmd.d use-tpm
else
    SKIP_BUILD=1 make -s -C /etc/bootcmd.d unuse-tpm
fi
