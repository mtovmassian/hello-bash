#!/usr/bin/env bash
#
# See book 'bash Idioms' pages 32, 33, 34

set -euo pipefail

main() {
    local string="$1";
    local mode="$2"
    local pattern="$3" # Example */
    local match="$4";

    [[ "$mode" == "prefix" && "$match" == "nongreedy" ]] \
        && echo "${string#$pattern}" \
        && return $?

    [[ "$mode" == "prefix" && "$match" == "greedy" ]] \
        && echo "${string##$pattern}" \
        && return $?

    [[ "$mode" == "suffix" && "$match" == "nongreedy" ]] \
        && echo "${string%$pattern}" \
        && return $?

    [[ "$mode" == "suffix" && "$match" == "greedy" ]] \
        && echo "${string%%$pattern}" \
        && return $?

    return 0
}

main "$@"