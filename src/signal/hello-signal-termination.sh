#!/usr/bin/env bash

set -euo pipefail

main() {
    set +e

    local signal="$1"

    sleep infinity &
    local process_pid="$!"
    
    kill -s "$signal" "$process_pid"
    wait "$process_pid"
    local process_exit_code="$?"
    local process_signal_termination_number="$(( "$process_exit_code" - 128 ))"
    local process_signal_termination_name
    process_signal_termination_name="$(kill -l "$process_signal_termination_number")"
    
    printf "Process exit code: %s\n" "$process_exit_code"
    printf "Process signal termination number: %s\n" "$process_signal_termination_number"
    printf "Process signal termination name: %s\n" "$process_signal_termination_name"

    set -e
}

main "$@"