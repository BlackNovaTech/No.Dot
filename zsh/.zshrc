# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

[[ $- = *i* ]] && source $HOME/.nodot/modules/liquidprompt/liquidprompt
source $HOME/.nodot/modules/nozsh/fzf.zsh

export PATH="$PATH:$HOME/bin"

# Source Aliases
if [[ -s "${ZDOTDIR:-$HOME}/.zshalias" ]]; then
  source "${ZDOTDIR:-$HOME}/.zshalias"
fi

# User config
if [[ -s "${ZDOTDIR:-$HOME}/.zshrc.local" ]]; then
  source "${ZDOTDIR:-$HOME}/.zshrc.local"
fi
