# tmux-extractor

A simple script to extract content of a tmux pane, filter them through `fzf`,
and piping the result to various CLI utilties, like `open`, `pbcopy`, or just
return the result into the bash prompt of the current pane.

## Dependencies

- [fzf](https://github.com/junegunn/fzf)

## Install

Clone this repository locally:

```sh
git clone https://github.com/pbnj/tmux-extractor </clone/path/to/tmux-extractor>
```

Then add the following to your `.tmux.conf`:

```text
if-shell " [ -d </clone/path/to/tmux-extractor> ] " run-shell "</clone/path/to/tmux-extractor>/tmux_extractor.tmux"
```

Reload tmux:

```sh
tmux source-file ~/.tmux.conf
```

## Usage

To extract text & insert into current tmux pane:

```sh
$ alias extractor="</clone/path/to/tmux-extractor/extractor.sh>"

# Now, you can invoke "extractor" whenever needed:
$ vim $(extractor)

# Or place a similar function in your .bashrc/.bash_profile/.zshrc/etc:
vix() {
    file="$(extractor)"
    [ -n "$file" ] && vim "$file"
}
```

To open using the default program:

```text
<prefix> + C-o
# fzf selection is opened in the default program
```

To copy into the system clipboard:

```text
<prefix> + C-c
# fzf selection is copied into system clipboard
```

## Configuration

You may configure options following the tmux syntax:

```text
set -g <key> <value>
```

The available options and their default values are:

- `@tmux-extractor-copy-bind` = `C-c`
- `@tmux-extractor-copy-command` = `pbcopy`
- `@tmux-extractor-open-bind` = `C-o`
- `@tmux-extractor-open-command` = `open`

## Credits

- [extrakto](https://github.com/laktak/extrakto) for the inspiration.
- [junegunn/fzf](https://github.com/junegunn/fzf) for the command-line fuzzy
  finder utility.
