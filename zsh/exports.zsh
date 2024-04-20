#!/bin/sh

export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"
export SHELL="zsh"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export STARSHIP_CACHE="$HOME/.starship/cache"
export PATH="$HOME/.local/bin":$PATH
export PATH="$HOME/.local/share/fnm:$PATH"
export PATH=$PATH:/home/blackmage/.spicetify
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export HISTFILE=$HOME/.zsh_history
export HISTSIZE=10000
export SAVEHIST=1000
export setopt APPEND_HISTORY
export setopt SHARE_HISTORY
export setopt HIST_EXPIRE_DUPS_FIRST
export setopt EXTENDED_HISTORY

eval "$(fnm env)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
