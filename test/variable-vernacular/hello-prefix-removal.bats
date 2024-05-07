TEST_HELPER_DIR="$(dirname "$BATS_TEST_DIRNAME")/test_helper"

setup() {
    load "${TEST_HELPER_DIR}/common-setup"
    _common_setup
}

@test "Non greedy removal" {
    run src/variable-vernacular/hello-prefix-removal.sh "_alpha_bravo_charly" "*_" nongreedy
    assert_output "alpha_bravo_charly"

    run src/variable-vernacular/hello-prefix-removal.sh "_alpha_bravo_charly" "*a" nongreedy
    assert_output "lpha_bravo_charly"

    run src/variable-vernacular/hello-prefix-removal.sh "_alpha_bravo_charly" "*alpha_" nongreedy
    assert_output "bravo_charly"
}

@test "Greedy removal" {
    run src/variable-vernacular/hello-prefix-removal.sh "_alpha_bravo_charly" "*_" greedy
    assert_output "charly"

    run src/variable-vernacular/hello-prefix-removal.sh "_alpha_bravo_charly" "*a" greedy
    assert_output "rly"

    run src/variable-vernacular/hello-prefix-removal.sh "_alpha_bravo_charly" "*alpha_" greedy
    assert_output "bravo_charly"
}

@test "Non greedy removal (slash)" {
    run src/variable-vernacular/hello-prefix-removal.sh "./ascript" "*/" nongreedy
    assert_output "ascript"

    run src/variable-vernacular/hello-prefix-removal.sh "../bin/ascript" "*/" nongreedy
    assert_output "bin/ascript"

    run src/variable-vernacular/hello-prefix-removal.sh "/home/guy/bin/ascript" "*/" nongreedy
    assert_output "home/guy/bin/ascript"
}

@test "Greedy removal (slash)" {
    run src/variable-vernacular/hello-prefix-removal.sh "./ascript" "*/"  greedy
    assert_output "ascript"

    run src/variable-vernacular/hello-prefix-removal.sh "../bin/ascript" "*/"  greedy
    assert_output "ascript"

    run src/variable-vernacular/hello-prefix-removal.sh "/home/guy/bin/ascript" "*/"  greedy
    assert_output "ascript"
}