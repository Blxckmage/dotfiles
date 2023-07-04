#!/bin/sh

export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="chrome"
export PATH="$HOME/.local/bin":$PATH
export PATH="/home/blackmage/.local/share/fnm:$PATH"

eval "$(fnm env)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
