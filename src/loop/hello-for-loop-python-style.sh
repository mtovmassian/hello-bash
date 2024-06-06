#!/usr/bin/env bash

set -euo pipefail

declare -a persons=(
    "Alice Alpha"
    "Bob Bravo"
    "Carol Charly"
    "Dave Delta"
)

main() {
    for person in "${persons[@]}"; do
        printf '%s\n' "$person"
    done
}

main