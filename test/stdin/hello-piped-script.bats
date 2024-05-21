TEST_HELPER_DIR="$(dirname "$BATS_TEST_DIRNAME")/test_helper"

setup() {
    load "${TEST_HELPER_DIR}/common-setup"
    _common_setup
}

@test "Bash executed a piped script with the given arguments" {
    run "src/stdin/hello-piped-script.sh" "x-ray" "yankee" "zulu"
    assert_output "This output comes from a script piped to bash with these arguments: x-ray yankee zulu"
}