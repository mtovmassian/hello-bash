#!/usr/bin/env bash

set -euo pipefail

ljust() {
    local text="$1"
    local spaces="$2"
    printf "%-${spaces}s" "$text"
}

main() {
    ljust "$1" "$2"
}

main "$@"