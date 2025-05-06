#!/bin/sh

# source
[ -s "/home/blackmage/.bun/_bun" ] && source "/home/blackmage/.bun/_bun"
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# source config
plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/exports.zsh"

# plugins
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"

autoload -Uz compinit
compinit

# fnm
FNM_PATH="/home/blackmage/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/blackmage/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

# ZVM
export ZVM_INSTALL="$HOME/.zvm/self"
export PATH="$PATH:$HOME/.zvm/bin"
export PATH="$PATH:$ZVM_INSTALL/"
