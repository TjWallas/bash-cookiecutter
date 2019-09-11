#!/bin/bash
# Using env bash is considered harmful:
# https://unix.stackexchange.com/questions/206350/what-is-the-difference-if-i-start-bash-with-bin-bash-or-usr-bin-env-bash

#/ Usage:
#/ Description:
#/ Examples:
#/ Options:
#/   --help: Display this help message
main() {
    source helpers_safe_bash.sh
    main "$@"

    # Script goes here
    # Important global vars:
    #  $ABS_SCRIPT_PATH
    #  $DIR : Script full dir path
    #  $FILENAME: Script filename
    # ...

    return
}

if [[ "${BASH_SOURCE[0]}" = "$0" ]]; then
    main "$@"
fi
