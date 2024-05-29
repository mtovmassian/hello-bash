#!/usr/bin/env bash

set -euo pipefail

ljust() {
    local space_count="$1"
    local text; text="$(tr -d '\n' <<< "$2")"
    printf "%-${space_count}s\n" "$text"
}

main() {
    local space_count="$1"
    { [[ -p /dev/stdin ]] && read -r text; } || text="$2"
    ljust "$space_count" "$text"
}

main "$@"