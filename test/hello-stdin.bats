setup() {
    load 'test_helper/common-setup'
    _common_setup
}

@test "stdin is both connected to a pipe and the terminal" {
    run bash -c "echo alpha bravo | hello-stdin.sh charly delta"
    assert_output "stdin is both connected to a pipe and the terminal, data received: [pipe=alpha bravo] [terminal=charly delta]"
}