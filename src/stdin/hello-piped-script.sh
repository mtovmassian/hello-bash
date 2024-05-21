#!/usr/bin/env bash

set -euo pipefail

main() {
    cat << EOF | bash -s -- "$@"
#!/usr/bin/env bash

printf "This output comes from a script piped to bash with these arguments: %s\n" "\$*"
EOF
}

main "$@"