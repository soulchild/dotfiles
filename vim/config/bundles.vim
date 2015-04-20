set nocompatible  " be iMproved
filetype off   		" required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" UI improvements
Plugin 'bling/vim-airline'
Plugin 'flazz/vim-colorschemes'

" Project
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/nerdtree.git'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'

" Code and tab completion
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdcommenter'

" Syntax highlighting and checking
Plugin 'scrooloose/syntastic'
Plugin 'gregsexton/MatchTag'
Plugin 'sheerun/vim-polyglot'

call vundle#end()            " required
filetype plugin indent on    " required
