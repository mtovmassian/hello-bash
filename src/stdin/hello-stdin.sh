#!/usr/bin/env bash

set -euo pipefail

main() {

    if [[ -p /dev/stdin ]]; then
        local data;
        read -r data
        printf "stdin is connected to a pipe with data received: %s\n" "$data"
    else
        printf "stdin is not connected to a pipe\n"
    fi

    if [[ $# -gt 0 ]]; then
        printf "stdin is connected to the terminal with data received: %s\n" "$*"
    else
        printf "stdin is not connected to the terminal\n"
    fi
    
}

main "$@"