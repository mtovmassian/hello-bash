#!/usr/bin/env bash

set -euo pipefail

main() {
    set +u
    set +o pipefail # Deactivate pipefail to avoid cacthing SIGPIPE signal sent to yes (141)

    local custom_string="$1"

    if [[ -n "$custom_string" ]]; then
        yes "$custom_string" \
            | { read -r data && printf "yes outputs custom string: %s\n" "$data"; }
    else
        yes \
            | { read -r data && printf "yes outputs default string: %s\n" "$data"; }
    fi
    set -u
    set +o pipefail
}

main "$@"