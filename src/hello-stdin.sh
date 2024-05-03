#!/usr/bin/env bash

set -euo pipefail

main() {
    local data;

    [[ -p /dev/stdin && $# -gt 0 ]] \
        && read -r data \
        && printf "stdin is both connected to a pipe and the terminal, data received: [pipe=%s] [terminal=%s]\n" "$data" "$*"
    
    [[ -p /dev/stdin ]] \
        && read -r data \
        && printf "stdin is only connected to a pipe, data received: [pipe=%s]\n" "$data"

    #[[ -h /dev/stdin && $# -gt 0 ]] \
    #    && printf "stdin is only connected to the terminal, data received: [terminal=%s] \n" "$*"
    
    return 0
}

main "$@"