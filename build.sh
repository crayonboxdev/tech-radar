#!/usr/bin/env bash
#
# This script loads the configuration from radar.config
# and generate an index.html file by replacing placeholder 
# text in template.html with the values from the configuration

set -euo pipefail

# shellcheck disable=SC2155
readonly PROG_NAME=$(basename "$0")
readonly ARGS="$@"

usage() {
    cat <<- EOF
$PROG_NAME - command line generator for technology radar  

Usage:

    $PROG_NAME [flags]

$PROG_NAME is a tool for generating an index.html file for the technology radar 
based on a config file.

Flags: 
    -h, --help      Show help

EOF
}

read_command_line() {
    while [ $# -gt 0 ]; do
        case "$1" in
        -h | --help )
            usage
            exit 0
            ;;
        -* )
            printf "flag provided but not defined: %s\n\n" "$1" >&2
            usage
            exit 1
            ;;
        esac 
    done
}

load_configuration() {
    local config="radar.config"

    if [ -f "$config" ]; then
        # shellcheck source=radar.config
        # shellcheck disable=SC1091
        . "${config}"
    else 
        echo "[ERROR] Couldn't find the $config configuration file"
        echo "[INFO] Please make sure the $config exists"
        exit 1
    fi
}

create_index_html() {
        # build statements
    local sed_statements=("-e s@\[ORG_NAME\]@$ORG_NAME@g")
    sed_statements+=("-e s@\[BASE_URL\]@$BASE_URL@g")
    sed_statements+=("-e s@\[DATE\]@$DATE@g")

    local i
    for ((i = 0; i < ${#QUADRANTS[@]}; i++)); do 
        sed_statements+=("-e s@\[QUADRANT_$i\]@${QUADRANTS[$i]}@g")
    done

    for ((i = 0; i < ${#RINGS[@]}; i++)); do 
        sed_statements+=("-e s@\[RING_$i\]@${RINGS[$i]}@g")
    done

    sed "${sed_statements[@]}" template.html > index.tmp

    mv -i "index.tmp" "index.html" 
}

main() {
    read_command_line "$ARGS"

    load_configuration

    create_index_html

    exit 0
}

cleanup() {
    # shellcheck disable=SC2317
    rm -f -- index.tmp
}

# Cleanup on exit 
trap cleanup EXIT

main