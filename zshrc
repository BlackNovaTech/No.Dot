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

alias tmux='tmux -2'
alias tmuxa='tmux -2 a'

alias novafix_wmjava='export _JAVA_AWT_WM_NONREPARENTING=1'
alias novafix_qtgray='export QT_X11_NO_MITSHM=1'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
