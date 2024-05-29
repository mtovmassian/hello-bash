TEST_HELPER_DIR="$(dirname "$BATS_TEST_DIRNAME")/test_helper"

setup() {
    load "${TEST_HELPER_DIR}/common-setup"
    _common_setup
}

@test "Iterate over persons list" {
    run src/looping-lingo/hello-for-loop-python-style.sh
    assert_output "$(cat <<EOF
Alice Alpha
Bob Bravo
Carol Charly
Dave Delta
EOF
)"
}
