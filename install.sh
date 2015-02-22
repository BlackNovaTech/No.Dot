#!/bin/sh

NODOT="${HOME}/.nodot"

link() {
  echo "Linking ${HOME}/${2} to ${1}"
  if [ -e "${HOME}/${2}" ]; then
    mv "${HOME}/${2}" "${HOME}/${2}.old"
    echo "  ${HOME}/${2} moved to ${HOME}/${2}.old"
  fi
  ln -fs "${1}" "${HOME}/${2}"
}

echo "Installing No.Dot!"

if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
  echo "Cloning Vundle"
  git clone https://github.com/gmarik/Vundle.vim.git "$HOME/.vim/bundle/Vundle.vim"
else
  echo "Vundle found!"
fi

if [ ! -d "$HOME/.zprezto" ]; then
  echo "Cloning Prezto"
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
else
  echo "Prezto found!"
fi

if [ ! -d "$NODOT" ]; then
  echo "Cloning No.Dot!"
  git clone --recursive https://github.com/BlackNovaTech/No.Dot.git "$NODOT"
  link "${NODOT}/gitconfig" ".gitconfig"
  link "${NODOT}/tmux.conf" ".tmux.conf"
  link "${NODOT}/vimrc" ".vimrc"
  link "${NODOT}/zlogin" ".zlogin"
  link "${NODOT}/zlogout" ".zlogout"
  link "${NODOT}/zpreztorc" ".zpreztorc"
  link "${NODOT}/zprofile" ".zprofile"
  link "${NODOT}/zshenv" ".zshenv"
  link "${NODOT}/zshrc" ".zshrc"
  echo "Calling Vundle install!"
  vim +PluginInstall +qall
else
  echo "No.Dot already installed, what are you waiting for?"
fi

echo "Done"
