# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

[[ $- = *i* ]] && source $HOME/.nodot/modules/liquidprompt/liquidprompt

export PATH="$PATH:$HOME/bin"

# User config
if [[ -s "${ZDOTDIR:-$HOME}/.zshrc.local" ]]; then
  source "${ZDOTDIR:-$HOME}/.zshrc.local"
fi
