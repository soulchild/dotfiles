#!/bin/zsh

DIR="$PWD/`dirname $0`"

ln -s $DIR/ack/ackrc ~/.ackrc
ln -s $DIR/git/gitconfig ~/.gitconfig
ln -s $DIR/vim/vimrc ~/.vimrc
ln -s $DIR/vim/gvimrc ~/.gvimrc
ln -s $DIR/zsh/zshrc ~/.zshrc

