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

# Only use RVM when we are a normal user
if [[ $EUID -ne 0 ]]; then
  export rvmsudo_secure_path=0
  export PATH="$PATH:/usr/local/rvm/bin" # Add RVM to PATH for scripting
  [[ -s "/usr/local/rvm/scripts/rvm" ]] && . "/usr/local/rvm/scripts/rvm"
fi
