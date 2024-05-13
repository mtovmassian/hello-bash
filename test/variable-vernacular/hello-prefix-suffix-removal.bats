TEST_HELPER_DIR="$(dirname "$BATS_TEST_DIRNAME")/test_helper"

setup() {
    load "${TEST_HELPER_DIR}/common-setup"
    _common_setup
}

@test "Remove prefix non greedy" {
    run src/variable-vernacular/hello-prefix-suffix-removal.sh "_alpha_bravo_charly" "prefix" "*_" nongreedy
    assert_output "alpha_bravo_charly"

    run src/variable-vernacular/hello-prefix-suffix-removal.sh "_alpha_bravo_charly" "prefix" "*a" nongreedy
    assert_output "lpha_bravo_charly"

    run src/variable-vernacular/hello-prefix-suffix-removal.sh "_alpha_bravo_charly" "prefix" "*alpha_" nongreedy
    assert_output "bravo_charly"
}

@test "Remove prefix greedy" {
    run src/variable-vernacular/hello-prefix-suffix-removal.sh "_alpha_bravo_charly" "prefix" "*_" greedy
    assert_output "charly"

    run src/variable-vernacular/hello-prefix-suffix-removal.sh "_alpha_bravo_charly" "prefix" "*a" greedy
    assert_output "rly"

    run src/variable-vernacular/hello-prefix-suffix-removal.sh "_alpha_bravo_charly" "prefix" "*alpha_" greedy
    assert_output "bravo_charly"
}

@test "Remove prefix non greedy (bash Idioms)" {
    run src/variable-vernacular/hello-prefix-suffix-removal.sh "./ascript" "prefix" "*/" nongreedy
    assert_output "ascript"

    run src/variable-vernacular/hello-prefix-suffix-removal.sh "../bin/ascript" "prefix" "*/" nongreedy
    assert_output "bin/ascript"

    run src/variable-vernacular/hello-prefix-suffix-removal.sh "/home/guy/bin/ascript" "prefix" "*/" nongreedy
    assert_output "home/guy/bin/ascript"
}

@test "Remove prefix greedy (bash Idioms)" {
    run src/variable-vernacular/hello-prefix-suffix-removal.sh "./ascript" "prefix" "*/"  greedy
    assert_output "ascript"

    run src/variable-vernacular/hello-prefix-suffix-removal.sh "../bin/ascript" "prefix" "*/"  greedy
    assert_output "ascript"

    run src/variable-vernacular/hello-prefix-suffix-removal.sh "/home/guy/bin/ascript" "prefix" "*/"  greedy
    assert_output "ascript"
}

@test "Remove suffix non greedy (bash Idioms)" {
    run src/variable-vernacular/hello-prefix-suffix-removal.sh "img.1231.jpg" "suffix" ".*" nongreedy
    assert_output "img.1231"

    run src/variable-vernacular/hello-prefix-suffix-removal.sh "./ascript" "suffix" "/*" nongreedy
    assert_output "."

    run src/variable-vernacular/hello-prefix-suffix-removal.sh "/home/guy/bin/ascrip" "suffix" "/*" nongreedy
    assert_output "/home/guy/bin"
}

@test "Remove suffix greedy (bash Idioms)" {
    run src/variable-vernacular/hello-prefix-suffix-removal.sh "img.1231.jpg" "suffix" ".*" greedy
    assert_output "img"

    run src/variable-vernacular/hello-prefix-suffix-removal.sh "./ascript" "suffix" "/*" greedy
    assert_output "."

    run src/variable-vernacular/hello-prefix-suffix-removal.sh "/home/guy/bin/ascrip" "suffix" "/*" greedy
    assert_output ""
}
