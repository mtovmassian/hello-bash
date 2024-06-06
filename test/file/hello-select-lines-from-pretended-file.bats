TEST_HELPER_DIR="$(dirname "$BATS_TEST_DIRNAME")/test_helper"

setup() {
    load "${TEST_HELPER_DIR}/common-setup"
    _common_setup
}

@test "select lines from proccess substitution output like it was a file" {
    run "src/file/hello-select-lines-from-pretended-file.sh" 1 6
    assert_output "$(cat <<EOF
alfa
bravo
charlie
delta
echo
foxtrot
EOF
)" 
}