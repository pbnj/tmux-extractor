#!/bin/bash

set -eou pipefail

set -x

extract() {
	tmux capture-pane -p \
		| tr ' ' '\n' \
		| tr -d '"' \
		| tr -d "'" \
		| tr -d ',' \
		| sort \
		| uniq \
		| fzf-tmux --height=20% --reverse
}

command="${1:-extract}"

if [ "${command}" = "extract" ]; then
	extract
elif [ "${command}" = "copy" ]; then
	text="$(extract)"
	[ -n "${text}" ] && echo "${text}" | pbcopy
elif [ "${command}" = "open" ]; then
	text="$(extract)"
	[ -n "${text}" ] && open "${text}"
fi
