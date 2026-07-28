source ~/.config/zsh/shell
source ~/.config/zsh/init
source ~/.config/zsh/aliases
source ~/.config/zsh/prompt
source ~/.config/zsh/inputrc
source ~/.config/zsh/envs

# source from Omarchy
# source ~/.local/share/omarchy/default/bash/aliases
source ~/.local/share/omarchy/default/bash/functions
source ~/.local/share/omarchy/default/bash/envs


. "$HOME/.local/share/../bin/env"

# bun completions
[ -s "/home/blackmage/.bun/_bun" ] && source "/home/blackmage/.bun/_bun"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
