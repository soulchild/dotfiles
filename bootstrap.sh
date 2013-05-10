#!/bin/sh

DIR="$PWD/`dirname $0`"

echo "Downloading and installing oh-my-zsh..."
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

ln -s $DIR/ack/ackrc ~/.ackrc
ln -s $DIR/git/gitconfig ~/.gitconfig
ln -s $DIR/vim/vimrc ~/.vimrc
ln -s $DIR/vim/gvimrc ~/.gvimrc
mv ~/.zshrc ~/.zshrc_default
ln -s $DIR/zsh/zshrc ~/.zshrc
ln -s $DIR/perltidy/perltidyrc ~/.perltidyrc

mkdir ~/.vim/colors
ln -s ~/.dotfiles/vim/ir_black.vim ~/.vim/colors/

curl -L http://cpanmin.us | perl - --sudo App::cpanminus
cpanm --sudo local::lib
