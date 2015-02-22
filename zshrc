if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

[[ $- = *i* ]] && source $HOME/.nodot/liquidprompt/liquidprompt

export PATH="$HOME/bin:${PATH}"

export EDITOR='vim'
export HISTSIZE=1000
export HISTFILESIZE=1000
export HISTCONTROL=erasedups

if [[ -s $HOME/.zshrc_local ]]; then source $HOME/.zshrc_local ; fi

alias tmux='tmux -2'
alias tmuxa='tmux -2 a'
