#!/usr/bin/env bash

set -euo pipefail

# Notes:
# It's possible to first merge stdout and stdin using 2>&1, and split them again in subsequent redirection commands (redirection applies in sequence, later redirections override earlier ones).
# >(command) is a process substitution creating a temporary pipe or file-like structure for the output to be processed by the specified command.

main() {
    date \
        1> >(xargs -I{} echo "OK: {}") \
        2> >(xargs -I{} echo "ERROR: {}" 1>&2)

    date "bad-date" \
        1> >(xargs -I{} echo "OK: {}") \
        2> >(xargs -I{} echo "ERROR: {}" 1>&2)
}

main