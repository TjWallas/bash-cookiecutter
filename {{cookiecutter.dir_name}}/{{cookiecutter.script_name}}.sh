#!/bin/bash
# Using env bash is considered harmful:
# https://unix.stackexchange.com/questions/206350/what-is-the-difference-if-i-start-bash-with-bin-bash-or-usr-bin-env-bash

main() {
    source helpers_safe_bash.sh
    main

    # Script goes here

    return
}

if [[ "${BASH_SOURCE[0]}" = "$0" ]]; then
    main
fi
