#!/usr/bin/env bash

set -euo pipefail

main() {
    awk -f hello-ansible-hosts-ini-to-yaml.awk hosts.ini 
}

main