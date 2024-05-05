TEST_HELPER_DIR="$(dirname "$BATS_TEST_FILENAME" | xargs dirname)/test_helper"

setup() {
    load "${TEST_HELPER_DIR}/common-setup"
    _common_setup
}

@test "lefthand and non greedy" {
    run src/variable-vernacular/hello-path.sh "./ascript" lefthand nongreedy
    assert_output "ascript"
}