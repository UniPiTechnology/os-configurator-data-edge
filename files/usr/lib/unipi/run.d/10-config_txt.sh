#!/bin/sh
#set -x

if [ -r /boot/firmware/config.txt ]; then
    CONFIG_TXT=$(readlink -f /boot/firmware/config.txt)
else
    CONFIG_TXT=$(readlink -f /boot/config.txt)
fi


# check or insert include into config.txt
if [ -f /etc/bootcmd.d/Makefile ]; then
    if [ "$HAS_TPM" = "1" ]; then
        suffix="_tpm"
        suffixd=""
    else
        suffix=""
        suffixd="_tpm"
    fi
    INCLUDE="dtoverlay=unipi_uboot$suffix"
    INCLUDED="dtoverlay=unipi_uboot$suffixd"
    mkdir -p /boot/firmware/overlays
    find /boot/overlays -name "unipi_uboot$suffix.dtbo" -exec cp \{\} /boot/firmware/overlays \;
    if [ -r "${CONFIG_TXT}" ] && grep -q -w -e "^[[:blank:]]*${INCLUDED}" "${CONFIG_TXT}"; then
         sed "/${INCLUDED}/d" -i "${CONFIG_TXT}"
    fi
else
    INCLUDE="include config_unipi.inc"
fi
if [ -r "${CONFIG_TXT}" ] && ! grep -q -w -e "^[[:blank:]]*${INCLUDE}" "${CONFIG_TXT}"; then
    sed "1 i${INCLUDE}" -i "${CONFIG_TXT}"
fi
