#!/usr/bin/env bash

set -euo pipefail

set +u
[[ -z "$TEST_HELPER_DIR" ]] && TEST_HELPER_DIR="test_helper"
set -u

_common_setup() {
    load "${TEST_HELPER_DIR}/bats-support/load"
    load "${TEST_HELPER_DIR}/bats-assert/load"
    # get the containing directory of this file
    # use $BATS_TEST_FILENAME instead of ${BASH_SOURCE[0]} or $0,
    # as those will point to the bats executable's location or the preprocessed file respectively
    PROJECT_ROOT="$( cd "$( dirname "$BATS_TEST_FILENAME" )/.." >/dev/null 2>&1 && pwd )"
    # make executables in src/ visible to PATH
    PATH="$PROJECT_ROOT/src:$PATH"
}