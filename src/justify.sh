#!/usr/bin/env bash

set -euo pipefail

ljust() {
    local text="$1"
    local spaces="$2"
    printf "%-${spaces}s" "$text"
}

rjust() {
    local text="$1"
    local spaces="$2"
    printf "%${spaces}s" "$text"
}
