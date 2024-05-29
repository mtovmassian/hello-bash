TEST_HELPER_DIR="$(dirname "$BATS_TEST_DIRNAME")/test_helper"

setup() {
    load "${TEST_HELPER_DIR}/common-setup"
    _common_setup
}

@test "Process is terminated by SIGINT" {
    run "src/signal/hello-signal-termination.sh" "SIGINT"
    assert_output "$(cat <<EOF
Process exit code: 130
Process signal termination number: 2
Process signal termination name: INT
EOF
)" 
}

@test "Process is terminated by SIGTERM" {
    run "src/signal/hello-signal-termination.sh" "SIGTERM"
    assert_output "$(cat <<EOF
Process exit code: 143
Process signal termination number: 15
Process signal termination name: TERM
EOF
)" 
}

@test "Process is terminated by SIGPIPE" {
    run "src/signal/hello-signal-termination.sh" "SIGPIPE"
    assert_output "$(cat <<EOF
Process exit code: 141
Process signal termination number: 13
Process signal termination name: PIPE
EOF
)" 
}