#!/usr/bin/env bash

set -euo pipefail

get_signal_termination_number_from_exit_code() {
    local exit_code="$1"
    echo "$(( "$exit_code" - 128 ))"
}

get_signal_termination_name_from_signal_termination_number() {
    local signal_termination_number="$1"
    kill -l "$signal_termination_number"
}

main() {
    set +e

    local signal="$1"

    sleep infinity &
    local sleep_infinity_pid="$!"
    
    kill -s "$signal" "$sleep_infinity_pid"
    wait "$sleep_infinity_pid"

    local exit_code="$?"
    local signal_termination_number
    signal_termination_number="$(get_signal_termination_number_from_exit_code "$exit_code")"
    local signal_termination_name
    signal_termination_name="$(get_signal_termination_name_from_signal_termination_number "$signal_termination_number")"
    
    printf "Exit code: %s\n" "$exit_code"
    printf "Signal termination number: %s\n" "$signal_termination_number"
    printf "Signal termination name: %s\n" "$signal_termination_name"

    set -e
}

main "$@"