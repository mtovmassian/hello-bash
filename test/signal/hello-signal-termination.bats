TEST_HELPER_DIR="$(dirname "$BATS_TEST_DIRNAME")/test_helper"

setup() {
    load "${TEST_HELPER_DIR}/common-setup"
    _common_setup
}

@test "Process is terminated by SIGINT" {
    run "src/signal/hello-signal-termination.sh" "SIGINT"
    assert_output "$(cat <<EOF
Exit code: 130
Signal termination number: 2
Signal termination name: INT
EOF
)" 
}

@test "Process is terminated by SIGTERM" {
    run "src/signal/hello-signal-termination.sh" "SIGTERM"
    assert_output "$(cat <<EOF
Exit code: 143
Signal termination number: 15
Signal termination name: TERM
EOF
)" 
}

@test "Process is terminated by SIGPIPE" {
    run "src/signal/hello-signal-termination.sh" "SIGPIPE"
    assert_output "$(cat <<EOF
Exit code: 141
Signal termination number: 13
Signal termination name: PIPE
EOF
)" 
}