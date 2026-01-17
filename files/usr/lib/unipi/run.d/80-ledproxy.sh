#!/bin/sh

# ToDo: remove this exit after fixing fwi2c --write-conf
exit 0

if ! [ "$VERBOSE" = "1" ]; then
    exec >/dev/null
fi

FWI2C=$(which fwi2c)
FWI2C=${FWI2C:-/opt/unipi/tools/fwi2c}
LEDFILE="/usr/share/unipi-os-configurator/ledmaps/${UNIPI_PRODUCT_ID:-.unknown.}"

if [ -x "$FWI2C" ] && [ -r "$LEDFILE" ]; then
    "$FWI2C" --write-conf "$LEDFILE"
fi
