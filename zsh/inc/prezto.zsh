zstyle ':prezto:*:*' case-sensitive 'no'
zstyle ':prezto:*:*' color 'yes'
zstyle ':prezto:load' pmodule \
  'environment' \
  'terminal' \
  'editor' \
  'history' \
  'directory' \
  'spectrum' \
  'utility' \
  'pacman' \
  'yum' \
  'completion' \
  'archive' \
  'ruby' \
  'syntax-highlighting' \
  'history-substring-search' \
  'prompt' \
  'ssh' \
  'rsync'

zstyle ':prezto:module:syntax-highlighting' highlighters \
  'main' \
  'brackets' \
  'pattern' \
  'line'

zstyle ':prezto:module:pacman' frontend 'pacaur'
zstyle ':prezto:module:ssh:load' identities 'id_rsa' 'id_ed25519'
