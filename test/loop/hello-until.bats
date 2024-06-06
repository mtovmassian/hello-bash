TEST_HELPER_DIR="$(dirname "$BATS_TEST_DIRNAME")/test_helper"

setup() {
    load "${TEST_HELPER_DIR}/common-setup"
    _common_setup
}

@test "Succeed after 3 attempts" {
    run src/loop/hello-until.sh
    assert_output "$(cat <<EOF
Failing at doing stuff. Will try again soon...
Failing at doing stuff. Will try again soon...
Failing at doing stuff. Will try again soon...
Did stuff after 3 attempts.
EOF
)"
}
