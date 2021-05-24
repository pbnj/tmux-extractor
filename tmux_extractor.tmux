#!/usr/bin/env bash
#===============================================================================
#   Author: Peter Benjamin
#  Created: May 23 2021
#===============================================================================
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# $1: option
# $2: default value
tmux_get() {
    local value
    value="$(tmux show -gqv "$1")"
    [ -n "$value" ] && echo "$value" || echo "$2"
}

copyKey="$(tmux_get '@tmux-extractor-copy-bind' 'C-c')"
tmux bind-key "$copyKey" run -b "${SCRIPT_DIR}/extractor.sh copy"

openKey="$(tmux_get '@tmux-extractor-open-bind' 'C-o')"
tmux bind-key "$openKey" run -b "${SCRIPT_DIR}/extractor.sh open"
