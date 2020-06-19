bindkey -d

. "$ZSH_INCLUDE/options.zsh"
. "$ZSH_INCLUDE/aliases.zsh"
. "$ZSH_HOME/zinit.zsh"

if [[ -s "$HOME/.zshrc.local" ]]; then source "$HOME/.zshrc.local"; fi
