#!/usr/bin/env bash

DIR="$PWD/`dirname $0`"
cd $DIR

function mk_symlink {
  if [ ! -z "$1" ] & [ ! -z "$2" ]
  then
    echo "Symlinking $1 -> $2"
    ln -s $1 $2 >/dev/null 2>&1
  else
    echo "mk_symlink() missing arguments."
  fi
}

function header {
  echo
  printf '=%.0s' {1..80}; echo
  echo $1
  printf '=%.0s' {1..80}; echo
}

header "Prezto"
if [ ! -d "${ZDOTDIR:-$HOME}" ]
then
  echo "Downloading and installing prezto..."
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
fi

# zsh/prezto
mv ~/.zshrc ~/.zshrc_default # backup
mk_symlink ~/.zprezto/runcoms/zshenv ~/.zshenv
mk_symlink ~/.zprezto/runcoms/zprofile ~/.zprofile
mk_symlink $DIR/zsh/zshrc ~/.zshrc
mk_symlink $DIR/zsh/zpreztorc ~/.zpreztorc
mk_symlink $DIR/zsh/zprofile ~/.zprofile

# Homebrew
header "Homebrew"
if ! command -v brew >/dev/null 2>&1; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update && brew doctor

header "Brewable components"
brew install fasd cmake the_silver_searcher node neovim
brew tap caskroom/fonts
brew cask install font-meslo-nerd-font

header "Node modules"
npm install -g prettier

header "Prezto clean prompt"
git clone https://github.com/cdonohue/prezto-clean-prompt.git ~/.zprezto/modules/prompt/external/clean
ln -sf ~/.zprezto/modules/prompt/external/clean/prompt_clean_setup ~/.zprezto/modules/prompt/functions

header "Symlinking configs"
# git
mk_symlink $DIR/git/gitconfig ~/.gitconfig

header "Vim"

# vim
[ ! -L ~/.vim/config ] && mk_symlink $DIR/vim/config ~/.vim/config
mk_symlink $DIR/vim/vimrc ~/.vimrc
mk_symlink $DIR/vim/gvimrc ~/.gvimrc

if [ ! -e "$HOME"/.vim/autoload/plug.vim ]; then
  echo "Installing vim-plug..."
  curl -fLo "$HOME"/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo "Running PluginInstall..."
vim -u "$HOME"/.vim/config/bundles.vim +PlugInstall +PlugClean! +qa

# OSX
header "OS X"
./osx/osx.sh

