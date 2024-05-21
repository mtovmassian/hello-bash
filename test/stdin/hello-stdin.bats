TEST_HELPER_DIR="$(dirname "$BATS_TEST_DIRNAME")/test_helper"

setup() {
    load "${TEST_HELPER_DIR}/common-setup"
    _common_setup
}

@test "stdin is connected to a pipe only" {
    run bash -c "echo alpha bravo | src/stdin/hello-stdin.sh"
    assert_output "$(cat <<EOF
stdin is connected to a pipe with data received: alpha bravo
stdin is not connected to the terminal
EOF
)" 
}

@test "stdin is connected to the terminal only" {
    run bash -c "src/stdin/hello-stdin.sh x-ray zulu"
    assert_output "$(cat <<EOF
stdin is not connected to a pipe
stdin is connected to the terminal with data received: x-ray zulu
EOF
)" 
}

@test "stdin is connected to both pipe and terminal" {
    run bash -c "echo alpha bravo | src/stdin/hello-stdin.sh x-ray zulu"
    assert_output "$(cat <<EOF
stdin is connected to a pipe with data received: alpha bravo
stdin is connected to the terminal with data received: x-ray zulu
EOF
)" 
}