function prompt_novalis_precmd {
  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    branch_format="(%F{cyan}%b%f%u%c%F{red}●%f)"
  else
    branch_format="(%F{cyan}%b%f%u%c)"
  fi

  zstyle ':vcs_info:*:prompt:*' formats "${branch_format}"

  vcs_info 'prompt'
  print ''
}

function prompt_novalis_setup {
  setopt LOCAL_OPTIONS
  unsetopt XTRACE KSH_ARRAYS
  prompt_opts=(cr percent subst)

  autoload -Uz add-zsh-hook
  autoload -Uz vcs_info

  add-zsh-hook precmd prompt_novalis_precmd

  # Formats:
  #   %b - branchname
  #   %u - unstagedstr (see below)
  #   %c - stagedstr (see below)
  #   %a - action (e.g. rebase-i)
  #   %R - repository path
  #   %S - path in the repository
  local branch_format="(%F{cyan}%b%f%u%c)"
  local action_format="(%F{green}%a%f)"
  local unstaged_format="%F{yellow}●%f"
  local staged_format="%F{green}●%f"

  # Set vcs_info parameters.
  zstyle ':vcs_info:*' enable bzr git hg svn
  zstyle ':vcs_info:*:prompt:*' check-for-changes true
  zstyle ':vcs_info:*:prompt:*' unstagedstr "${unstaged_format}"
  zstyle ':vcs_info:*:prompt:*' stagedstr "${staged_format}"
  zstyle ':vcs_info:*:prompt:*' actionformats "${branch_format}${action_format}"
  zstyle ':vcs_info:*:prompt:*' formats "${branch_format}"
  zstyle ':vcs_info:*:prompt:*' nvcsformats   ""

  PROMPT="%(!.%F{magenta}.%F{cyan})%n%f"

  if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    PROMPT="$PROMPT at %F{yellow}%m%f"
  fi

  # Define prompts.
  PROMPT="$PROMPT in %F{green}%~%f%F{yellow}%(1j. ★%j.)%f "'${vcs_info_msg_0_}'"
%(?.%F{green}.%F{red}%? )%(!.#.❯)%f "

  RPROMPT=''
}

prompt_novalis_setup "$@"
