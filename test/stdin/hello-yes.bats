TEST_HELPER_DIR="$(dirname "$BATS_TEST_DIRNAME")/test_helper"

setup() {
    load "${TEST_HELPER_DIR}/common-setup"
    _common_setup
}

@test "yes outputs custom string" {
    run "src/stdin/hello-yes.sh" "YES"
    assert_output "yes outputs custom string: YES"
}

@test "yes outputs default string" {
    run "src/stdin/hello-yes.sh"
    assert_output "yes outputs default string: y"
}
