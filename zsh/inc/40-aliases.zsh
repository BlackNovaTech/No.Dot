# Meet a nice hack:
# If an alias ends in a space the next word is also expanded
alias sudo="sudo "

alias se="sudo $EDITOR"

alias f='fzf --preview="pygmentize -g {}" --preview-window=right:60% --ansi --bind "enter:execute(vim {})"'

if [[ -s "$HOME/.zshalias.local" ]]; then source "$HOME/.zshalias.local"; fi

