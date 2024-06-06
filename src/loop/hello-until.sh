#!/usr/bin/env bash

set -euo pipefail

declare -i DO_STUFF_COUNTER 
DO_STUFF_COUNTER=0

do_stuff() {
    [[ "$DO_STUFF_COUNTER" -eq 3 ]] && return 0
    ((DO_STUFF_COUNTER+=1))
    return 1
}

main() {
    until do_stuff; do
        echo "Failing at doing stuff. Will try again soon..."
    done
    echo "Did stuff after ${DO_STUFF_COUNTER} attempts."
}

main "$@"