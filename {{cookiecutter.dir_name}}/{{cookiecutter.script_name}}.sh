#!/bin/bash
# Using env bash is considered harmful:
# https://unix.stackexchange.com/questions/206350/what-is-the-difference-if-i-start-bash-with-bin-bash-or-usr-bin-env-bash

# https://sipb.mit.edu/doc/safe-shell/
# GLOBBING IS NOT ALLOWED!!
set -euf -o pipefail

# http://redsymbol.net/articles/unofficial-bash-strict-mode/
IFS=$'\n\t'

# --- Helper scripts begin ---
# https://dev.to/thiht/shell-scripts-matter

#/ Usage:
#/ Description:
#/ Examples:
#/ Options:
#/   --help: Display this help message
usage() { grep '^#/' "$0" | cut -c4- ; exit 0 ; }
expr "$*" : ".*--help" > /dev/null && usage

readonly LOG_FILE="/tmp/$(basename "$0").log"
readonly DATE_FORMAT="%Y-%m-%d %H:%M:%S.%N"
info()    { echo "[`date +$DATE_FORMAT`] [INFO]    $*" | tee -a "$LOG_FILE" >&2 ; }
warning() { echo "[`date +$DATE_FORMAT`] [WARNING] $*" | tee -a "$LOG_FILE" >&2 ; }
error()   { echo "[`date +$DATE_FORMAT`] [ERROR]   $*" | tee -a "$LOG_FILE" >&2 ; }
fatal()   { echo "[`date +$DATE_FORMAT`] [FATAL]   $*" | tee -a "$LOG_FILE" >&2 ; exit 1 ; }

cleanup() {
    # Remove temporary files
    # Restart services
    # ...
    info "Cleaning up before exit..."
}

if [[ "${BASH_SOURCE[0]}" = "$0" ]]; then
    trap cleanup EXIT
    # Script goes here
    # ...
fi

# --- Helper scripts end ---

# https://stackoverflow.com/questions/2853803/in-a-shell-script-echo-shell-commands-as-they-are-executed
# set -x

# Code begins here...
