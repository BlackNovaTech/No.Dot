# vim:ft=zplug

zplug "zplug/zplug", hook-build:'zplug --self-manage'

zplug "$NODOT_PATH/zsh/inc", from:local, use:"<->\-*.zsh"

zplug "Valodim/zsh-curl-completion"

zplug "stedolan/jq", as:command, from:gh-r, rename-to:jq
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
zplug "BurntSushi/ripgrep", as:command, from:gh-r, rename-to:rg
zplug "peco/peco", as:command, from:gh-r

zplug "Fakerr/git-recall", as:command, use:'git-recall'

zplug "sorin-ionescu/prezto", as:plugin, use:init.zsh, \
  hook-build:"ln -s $ZPLUG_ROOT/repos/sorin-ionescu/prezto ${ZDOTDIR:-$HOME}/.zprezto"
source "$ZSH_INCLUDE/prezto.zsh"

zplug "molovo/filthy", as:theme, use:filthy.zsh, rename-to:prompt_filthy_setup

