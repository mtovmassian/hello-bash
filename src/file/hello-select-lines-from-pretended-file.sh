#!/usr/bin/env bash

set -euo pipefail

get_pretended_file_content() {
    cat << EOF
alfa
bravo
charlie
delta
echo
foxtrot
golf
hotel
india
juliett
kilo
lima
mike
november
oscar
papa
quebec
romeo
sierra
tango
uniform
victor
whiskey
x-ray
yankee
zulu
EOF
}

main() {
    local -i line_min="$1"
    local -i line_max="$2"
    local -i line_max_next="$(( line_max + 1))"
    sed -n "${line_min},${line_max}p;${line_max_next}q" <(get_pretended_file_content) # sed extract/print lines from line_min to line_max and stop processing after line_max_next (optimize performance)
}

main "$@"