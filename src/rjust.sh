#!/usr/bin/env bash

set -euo pipefail

rjust() {
    local text="$1"
    local spaces="$2"
    printf "%${spaces}s" "$text"
}

main() {
    rjust "$1" "$2"
}

main "$@"