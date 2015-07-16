if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

[[ $- = *i* ]] && source $HOME/.nodot/liquidprompt/liquidprompt

export PATH="${PATH}:$HOME/bin"

export EDITOR='vim'
export HISTSIZE=1000
export HISTFILESIZE=1000
export HISTCONTROL=erasedups

if [[ -s $HOME/.zshrc_local ]]; then source $HOME/.zshrc_local ; fi
if [[ -s $HOME/.zshalias ]]; then source $HOME/.zshalias ; fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
