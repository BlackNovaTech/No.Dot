# vim:ft=zplug

case "$OSTYPE" in
  *darwin*)
    USE_OS="darwin"
    ;;
  *linux*)
    USE_OS="linux"
    ;;
  *) # Fall back on linux
    USE_OS="linux"
    ;;
esac

zplug "zplug/zplug", hook-build:'zplug --self-manage'

zplug "$NODOT_PATH/zsh/inc", from:local, use:"<->\-*.zsh"
zplug "$NODOT_PATH/zsh/prompt", from:local, as:theme, use:novalis.zsh, rename-to:prompt_novalis_setup

# JSON Query -- Grep for JSON
#zplug "stedolan/jq", as:command, from:gh-r, rename-to:jq
# Record Query -- Better grep for JSON
#zplug "dflemstr/rq", as:command, from:gh-r, rename-to:rq

# exa -- Rust replacement for ls
zplug "ogham/exa", as:command, from:gh-r, rename-to:exa, use:"*$USE_OS*"
# fd -- easier to use find replacement
zplug "sharkdp/fd", as:command, from:gh-r, rename-to:fd
# fzf -- fuzzy searching
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
# ripgrep -- faster grep, more features
zplug "BurntSushi/ripgrep", as:command, from:gh-r, rename-to:rg
# xzv -- CSV stream editor
zplug "BurntSushi/xsv", as:command, from:gh-r, rename-to:xsv
# peco -- also fuzzy searching
zplug "peco/peco", as:command, from:gh-r
# fzy -- even more fuzzy searching
zplug "jhawthorn/fzy", as:command, hook-build:"make", use:fzy
# z -- jumpy jumpy
zplug "rupa/z", use:'(*).sh'

zplug "sorin-ionescu/prezto", as:plugin, use:init.zsh, \
  hook-build:"ln -s $ZPLUG_ROOT/repos/sorin-ionescu/prezto ${ZDOTDIR:-$HOME}/.zprezto"
source "$ZSH_INCLUDE/prezto.zsh"
