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

echo "Downloading and installing prezto..."
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# zsh/prezto
echo "Setting up prezto..."
mv ~/.zshrc ~/.zshrc_default # backup
mk_symlink ~/.zprezto/runcoms/zshenv ~/.zshenv
mk_symlink ~/.zprezto/runcoms/zprofile ~/.zprofile
mk_symlink $DIR/zsh/zshrc ~/.zshrc
mk_symlink $DIR/zsh/zpreztorc ~/.zpreztorc
mk_symlink $DIR/zsh/zprofile ~/.zprofile

echo "Installing Homebrew..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew doctor

echo "Installing FASD..."
brew install fasd

echo "Installing cmake..."
brew install cmake

echo "Installing powerline fonts..."
git clone https://github.com/powerline/fonts.git /tmp/powerline-fonts && /tmp/powerline-fonts/install.sh

# ack
mk_symlink $DIR/ack/ackrc ~/.ackrc

# git
mk_symlink $DIR/git/gitconfig ~/.gitconfig

# perltidy
mk_symlink $DIR/perltidy/perltidyrc ~/.perltidyrc

# vim
[ ! -L ~/.vim/config ] && mk_symlink $DIR/vim/config ~/.vim/config
mk_symlink $DIR/vim/vimrc ~/.vimrc
mk_symlink $DIR/vim/gvimrc ~/.gvimrc

echo "Cloning vundle..."
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Installing vim plugins..."
vim +PluginInstall +qall

if [ ! -f ~/.vim/bundle/YouCompleteMe/third_party/ycmd/ycm_core.so ] 
then
  echo "Compiling YouCompleteMe..."
  cd ~/.vim/bundle/YouCompleteMe && ./install.sh
fi

# perl
echo "Installing cpanm and local::lib"
curl -L http://cpanmin.us | perl - --sudo App::cpanminus
cpanm --sudo local::lib
