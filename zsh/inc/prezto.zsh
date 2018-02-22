zstyle ':prezto:*:*' case-sensitive 'no'
zstyle ':prezto:*:*' color 'yes'

loadorder=(
  environment
  terminal
  editor
  history
  directory
  spectrum
  utility
  completion
  archive
  syntax-highlighting
  history-substring-search
  prompt
)

command_exists() {
  type "$1" &> /dev/null
}

command_exists gpg    && loadorder+=( gpg )
command_exists pacman && loadorder+=( pacman )
command_exists dnf    && loadorder+=( dnf )
command_exists yum    && loadorder+=( yum )
command_exists ruby   && loadorder+=( ruby )
command_exists rsync  && loadorder+=( rsync )

zstyle ':prezto:load' pmodule $loadorder

zstyle ':prezto:module:syntax-highlighting' highlighters \
  'main' \
  'brackets' \
  'pattern' \
  'line'

zstyle ':prezto:module:pacman' frontend 'pacaur'
