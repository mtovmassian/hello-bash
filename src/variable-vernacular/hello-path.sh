#!/usr/bin/env bash

set -euo pipefail

main() {
    local path="$1";
    local side="$2";
    local match="$3";

    [[ "$side" == "lefthand" && "$match" == "nongreedy" ]] \
        && echo "${path#*/}" \
        && return $?

    [[ "$side" == "lefthand" && "$match" == "greedy" ]] \
        && echo "${path##*/}" \
        && return $?

    return 0
}

main "$@"