# vim:ft=zplug

zplug "zplug/zplug", hook-build:'zplug --self-manage'

zplug "$NODOT_PATH/zsh/inc", from:local, use:"<->\-*.zsh"
# zplug "$NODOT_PATH/zsh/prompt", from:local, as:theme, use:novalis.zsh, rename-to:prompt_novalis_setup

zplug "denysdovhan/spaceship-zsh-theme", use:spaceship.zsh, from:github, as:theme

zplug "Valodim/zsh-curl-completion"

zplug "stedolan/jq", as:command, from:gh-r, rename-to:jq
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
zplug "BurntSushi/ripgrep", as:command, from:gh-r, rename-to:rg
zplug "peco/peco", as:command, from:gh-r
zplug "jhawthorn/fzy", as:command, hook-build:"make", use:fzy

zplug "Fakerr/git-recall", as:command, use:'git-recall'

zplug "sorin-ionescu/prezto", as:plugin, use:init.zsh, \
  hook-build:"ln -s $ZPLUG_ROOT/repos/sorin-ionescu/prezto ${ZDOTDIR:-$HOME}/.zprezto"
source "$ZSH_INCLUDE/prezto.zsh"
