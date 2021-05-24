#!/bin/bash
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

extractorKey="$(tmux_get '@tmux-extractor-extract-bind' 'C-e')"
tmux bind-key "$extractorKey" run -b "${SCRIPT_DIR}/extractor.sh 'extract'"

copyKey="$(tmux_get '@tmux-extractor-copy-bind' 'C-c')"
# copyCmd="$(tmux_get '@tmux-extractor-copy-command' 'pbcopy')"
tmux bind-key "$copyKey" run -b "${SCRIPT_DIR}/extractor.sh copy"

openKey="$(tmux_get '@tmux-extractor-open-bind' 'C-o')"
# openCmd="$(tmux_get '@tmux-extractor-open-command' 'open')"
tmux bind-key "$openKey" run -b "${SCRIPT_DIR}/extractor.sh open"
