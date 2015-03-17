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

echo "Cloning vundle..."
git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle

echo "Cloning z..."
git clone https://github.com/rupa/z.git ~/.dotfiles/

echo "Installing Homebrew..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew doctor

echo "Installing FASD..."
brew install fasd

# ack
mk_symlink $DIR/ack/ackrc ~/.ackrc

# git
mk_symlink $DIR/git/gitconfig ~/.gitconfig

# vim
mk_symlink $DIR/vim/vimrc ~/.vimrc
mk_symlink $DIR/vim/gvimrc ~/.gvimrc

# zsh/prezto
mv ~/.zshrc ~/.zshrc_default # backup
mk_symlink ~/.zprezto/runcoms/zshenv ~/.zshenv
mk_symlink ~/.zprezto/runcoms/zprofile ~/.zprofile
mk_symlink $DIR/zsh/zshrc ~/.zshrc
mk_symlink $DIR/zsh/zpreztorc ~/.zpreztorc
mk_symlink $DIR/zsh/zprofile ~/.zprofile

# terminal colors
mkdir ~/.vim/colors 
mk_symlink ~/.dotfiles/vim/ir_black.vim ~/.vim/colors/

# perl
mk_symlink $DIR/perltidy/perltidyrc ~/.perltidyrc
curl -L http://cpanmin.us | perl - --sudo App::cpanminus
cpanm --sudo local::lib
