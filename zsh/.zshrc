bindkey -d

export ZPLUG_LOADFILE="$ZSH_INCLUDE/plugs.zsh"
if [[ ! -f "$ZPLUG_HOME/init.zsh" ]]; then
  git clone https://github.com/zplug/zplug $ZPLUG_HOME
fi

source "$ZPLUG_HOME/init.zsh"
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
    echo
fi
zplug load

# I fucking hate this file
# The risk of breaking things is worth the hassle
if [[ -f "$HOME/.zplug/log/job.lock" ]]; then
  rm "$HOME/.zplug/log/job.lock"
fi

if [[ -s "$HOME/.zshrc.local" ]]; then source "$HOME/.zshrc.local"; fi
