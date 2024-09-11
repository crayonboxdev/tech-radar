#!/bin/bash

set -euo pipefail

CONFIG_FILE="radar.config"

if [ -f "$CONFIG_FILE" ]; then
    # shellcheck source=radar.config
    # shellcheck disable=SC1091
    . "${CONFIG_FILE}"
else 
    echo "Couldn't find the $CONFIG_FILE configuration file"
    echo "Please make sure the $CONFIG_FILE exists"
    exit 1
fi

exit 0