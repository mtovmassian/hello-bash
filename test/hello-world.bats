setup() {
    load 'test_helper/common-setup'
    _common_setup
}

@test "Print Hello, world!" {
    run hello-world.sh
    assert_output "Hello, world!"
}