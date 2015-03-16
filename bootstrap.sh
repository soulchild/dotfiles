#!/bin/sh

DIR="$PWD/`dirname $0`"

echo "Downloading and installing prezto..."
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

echo "Cloning vundle..."
git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle

echo "Cloning z..."
git clone https://github.com/rupa/z.git ~/.dotfiles/

# ack
ln -s $DIR/ack/ackrc ~/.ackrc

# git
ln -s $DIR/git/gitconfig ~/.gitconfig

# vim
ln -s $DIR/vim/vimrc ~/.vimrc
ln -s $DIR/vim/gvimrc ~/.gvimrc

# zsh/prezto
mv ~/.zshrc ~/.zshrc_default # backup
ln -s ~/.zprezto/runcoms/zshenv ~/.zshenv
ln -s ~/.zprezto/runcoms/zprofile ~/.zprofile
ln -s $DIR/zsh/zshrc ~/.zshrc
ln -s $DIR/zsh/zpreztorc ~/.zpreztorc
ln -s $DIR/zsh/zprofile ~/.zprofile

# terminal colors
mkdir ~/.vim/colors
ln -s ~/.dotfiles/vim/ir_black.vim ~/.vim/colors/

# perl
ln -s $DIR/perltidy/perltidyrc ~/.perltidyrc
curl -L http://cpanmin.us | perl - --sudo App::cpanminus
cpanm --sudo local::lib
