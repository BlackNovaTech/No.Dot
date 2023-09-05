# vim:foldlevel=0:foldmethod=marker:
# shellcheck shell=zsh

if [[ ! -d "$ZINIT_HOME" ]]; then
  echo 'Fetching zdharma-continuum/zinit'
  mkdir -p "$ZINIT_HOME"
  git clone --quiet https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME/bin"
fi

. "$ZINIT_HOME/bin/zinit.zsh"

zinit light zdharma-continuum/zinit-annex-readurl
zinit light zdharma-continuum/zinit-annex-bin-gem-node

# Prompt?
if [ "${TERM##*-}" = '256color' ] || [ "${terminfo[colors]:?}" -gt 255 ]; then
	if [ "$NODOT_USE_STARSHIP" = 'y' ]; then
		zinit from'gh-r' as'null' lucid for \
			sbin'starship' starship/starship

		eval "$(starship init zsh)"
	else
		zinit ice lucid depth=1
		zinit light romkatv/powerlevel10k
		. "$ZSH_INCLUDE/powerlevel10k.zsh"
	fi
fi

zstyle ':prezto:module:terminal' auto-title 'yes'
zstyle ':prezto:module:editor' dot-expansion 'yes'
zstyle ':prezto:module:editor' ps-context 'yes'
zstyle ':prezto:module:prompt' managed 'yes'
zstyle ':prezto:module:pacman' frontend 'yay'
zstyle ':prezto:module:ssh:load' identities 'id_rsa' 'id_ed25519'

zinit snippet PZTM::environment
zinit snippet PZTM::terminal
zinit snippet PZTM::editor
zinit snippet PZTM::history
zinit snippet PZTM::utility
zinit snippet PZTM::completion
#zinit snippet PZTM::ssh

zinit wait lucid for \
	PZTM::directory \
	OMZP::extract


zinit wait'0a' lucid for \
	has'pacman' PZTM::pacman \
	has'dnf' OMZP::dnf \
	has'yum' OMZP::yum \
	has'rsync' OMZP::rsync \
	has'kubectl' OMZP::kubectl/kubectl.plugin.zsh \
	has'helm' OMZP::helm/helm.plugin.zsh \
	has'ansible' OMZP::ansible/ansible.plugin.zsh \
	has'pip' OMZP::pip/pip.plugin.zsh

zinit wait lucid for \
	light-mode zdharma-continuum/history-search-multi-word \
	light-mode zsh-users/zsh-history-substring-search

[ -n "${terminfo[kcuu1]}" ] && bindkey "${terminfo[kcuu1]}" history-substring-search-up
[ -n "${terminfo[kcud1]}" ] && bindkey "${terminfo[kcud1]}" history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

zinit wait'0z' lucid for \
	atinit'ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay' \
		zdharma-continuum/fast-syntax-highlighting \
	blockf \
		zsh-users/zsh-completions \
	atload'!_zsh_autosuggest_start' \
		zsh-users/zsh-autosuggestions

zinit wait'0z' as'completion' lucid for \
	OMZP::docker/completions/_docker \
	OMZP::docker-compose/_docker-compose

zinit wait'0b' lucid for \
	MichaelAquilina/zsh-you-should-use \
	hlissner/zsh-autopair \
	Tarrasch/zsh-bd \
  MenkeTechnologies/zsh-cargo-completion

zinit wait'0c' from'gh-r' as'null' lucid for \
	sbin'fzf' junegunn/fzf \
	mv'bin/exa -> exa' sbin ogham/exa \
	mv'fd* -> fd' sbin'fd/fd' @sharkdp/fd \
	mv'bat* -> bat' sbin'bat/bat' @sharkdp/bat \
	mv'ripgrep* -> ripgrep' sbin'ripgrep/rg' BurntSushi/ripgrep \
	sbin'xsv' BurntSushi/xsv \
	mv'jq* -> jq' sbin'jq' jqlang/jq \
	mv'jiq* -> jiq' sbin'jiq' fiatjaf/jiq \
	# bpick'youtube-dl' sbin'youtube-dl' ytdl-org/youtube-dl \

# Kubectl stuff
zinit wait'0c' as'readurl|null' has'kubectl' \
	sbin'**/helm' id-as='helm' \
	extract dlink="https://get.helm.sh/helm-v3%VERSION%-$(uname | tolower)-amd64.tar.gz" \
	lucid for https://github.com/helm/helm/releases

zinit wait'0c' from'gh-r' as'null' has'kubectl' lucid for \
	sbin'k9s' derailed/k9s
