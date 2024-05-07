#!/usr/bin/env bash

# shellcheck disable=SC2295

set -euo pipefail

main() {
    local string="$1";
    local prefix_pattern="$2" # Example */
    local match="$3";

    [[ "$match" == "nongreedy" ]] \
        && echo "${string#$prefix_pattern}" \
        && return $?

    [[ "$match" == "greedy" ]] \
        && echo "${string##$prefix_pattern}" \
        && return $?

    return 0
}

main "$@"