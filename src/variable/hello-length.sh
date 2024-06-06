#!/usr/bin/env bash

set -euo pipefail

main() {
    local string="$1";

    echo "${#string}"
}

main "$@"