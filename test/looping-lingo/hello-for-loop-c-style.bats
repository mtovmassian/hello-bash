TEST_HELPER_DIR="$(dirname "$BATS_TEST_DIRNAME")/test_helper"

setup() {
    load "${TEST_HELPER_DIR}/common-setup"
    _common_setup
}

@test "Iterate 10 times" {
    run src/looping-lingo/hello-for-loop-c-style.sh
    assert_output "$(cat <<EOF
0
1
2
3
4
5
6
7
8
9
EOF
)"
}
