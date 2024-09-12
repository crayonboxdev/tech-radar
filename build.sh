#!/usr/bin/env bash

set -euo pipefail

CONFIG_FILE="radar.config"

if [ -f "$CONFIG_FILE" ]; then
    # shellcheck source=radar.config
    # shellcheck disable=SC1091
    . "${CONFIG_FILE}"
else 
    echo "[ERROR] Couldn't find the $CONFIG_FILE configuration file"
    echo "[INFO] Please make sure the $CONFIG_FILE exists"
    exit 1
fi

main() {
    local sed_statements=("-e s@\[ORG_NAME\]@$ORG_NAME@g")
    sed_statements+=("-e s@\[BASE_URL\]@$BASE_URL@g")
    sed_statements+=("-e s@\[DATE\]@$DATE@g")

    
    for ((i = 0; i < ${#QUADRANTS[@]}; i++)); do 
        sed_statements+=("-e s@\[QUADRANT_$i\]@${QUADRANTS[$i]}@g")
    done

    for ((i = 0; i < ${#RINGS[@]}; i++)); do 
        sed_statements+=("-e s@\[RING_$i\]@${RINGS[$i]}@g")
    done

    sed "${sed_statements[@]}" template.html > index.tmp

    mv -i "index.tmp" "index.html" 
}

# Cleanup on exit 
trap "{ rm -f -- index.tmp;}" EXIT

main

exit 0