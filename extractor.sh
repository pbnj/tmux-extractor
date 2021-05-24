#!/usr/bin/env bash

extract() {
	tmux capture-pane -p \
		| tr ' ' '\n' \
		| tr -d '"' \
		| tr -d "'" \
		| tr -d ',' \
		| sort -u \
		| fzf-tmux -d 20% --reverse
}

command="${1:-extract}"

if [ "${command}" = "extract" ]; then
	extract
elif [ "${command}" = "copy" ]; then
	text="$(extract)"
	[ -z "${text}" ] && exit
	echo "${text}" | pbcopy
elif [ "${command}" = "open" ]; then
	text="$(extract)"
	[ -z "${text}" ] && exit
	open "${text}"
fi
