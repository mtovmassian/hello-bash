TEST_HELPER_DIR="$(dirname "$BATS_TEST_FILENAME" | xargs dirname)/test_helper"

setup() {
    load "${TEST_HELPER_DIR}/common-setup"
    _common_setup
}

@test "length of empty string" {
    run src/variable-vernacular/hello-length.sh ""
    assert_output "0"
}

@test "length of non empty string" {
    run src/variable-vernacular/hello-length.sh "alpha"
    assert_output "5"

    run src/variable-vernacular/hello-length.sh "alpha bravo"
    assert_output "11"

    run src/variable-vernacular/hello-length.sh "alpha bravo charly"
    assert_output "18"
}
