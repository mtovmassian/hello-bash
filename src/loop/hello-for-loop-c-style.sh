#!/usr/bin/env bash

set -euo pipefail

declare -i i 

main() {
    for ((i=0; i<10;i++)); do
        printf '%d\n' "$i"
    done
}

main