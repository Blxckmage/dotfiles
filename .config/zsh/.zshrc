source ~/.config/zsh/shell
source ~/.config/zsh/init
source ~/.config/zsh/aliases
source ~/.config/zsh/prompt
source ~/.config/zsh/inputrc
source ~/.config/zsh/envs

# source from Omarchy
# source ~/.local/share/omarchy/default/bash/aliases
[ -f ~/.local/share/omarchy/default/bash/functions ] && source ~/.local/share/omarchy/default/bash/functions
[ -f ~/.local/share/omarchy/default/bash/envs ] && source ~/.local/share/omarchy/default/bash/envs


[ -f "$HOME/.local/share/../bin/env" ] && . "$HOME/.local/share/../bin/env"

# bun completions
[ -s "/home/blackmage/.bun/_bun" ] && source "/home/blackmage/.bun/_bun"
