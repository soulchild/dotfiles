set nocompatible

" --------------------------------
" File handling
" --------------------------------
set noswapfile
set nobackup
set nowritebackup
set autowrite

" --------------------------------
" Text formatting and editing
" --------------------------------
set autoindent          " automatic indent new lines
set smartindent         " do it smart
set nowrap
set expandtab           " expand tabs to spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set nosmarttab          " fuck tabs
set shiftround          " use multiple of shiftwidth when indenting with '<' and '>'
set hlsearch            " highlight search terms
set incsearch           " show search matches as you type
set ruler               " show cursor position
set showmatch           " match brackets and braces
set visualbell          " shut up
set nostartofline       " don't jump to the start of line when scrolling
set wildmenu            " turn on sane autocompletion
set wildmode=list:longest,full
set number
set showmode
set showcmd
syntax on

" --------------------------------
" Status line
" --------------------------------
set laststatus=2

" --------------------------------
" Colorscheme
" --------------------------------
if &t_Co >= 256 || has("gui_running")
   colorscheme ir_black
endif

if &t_Co > 2 || has("gui_running")
   " switch syntax highlighting on, when the terminal has colors
   syntax on
endif

:highlight CursorLine guibg=#222222

set guifont=Source\ Code\ Pro\ for\ Powerline:h12

" --------------------------------
" netrw
" --------------------------------
let g:netrw_list_hide='^\.svn/$,\.DS_Store'

" --------------------------------
" Remapping
" --------------------------------
let mapleader=" "

" map ctrl+c and ctrl+v to copy and paste
nmap <C-V> "+gP
imap <C-V> <ESC><C-V>i
vmap <C-C> "+y

" open new tab with ctrl+t
nmap <C-T> :tabnew<CR>
imap <C-T> <ESC><C-T>i

" open file browser with ctrl+o
nmap <C-O> <C-T>:Ex<CR>
imap <C-O> <ESC><C-O>i

" change to directory of current file on editing
autocmd BufEnter * lcd %:p:h

" --------------------------------
" NERDTree
" --------------------------------
let NERDTreeShowBookmarks=1
map <silent> <C-n> :NERDTreeTabsToggle<CR>
nnoremap <Leader>n :NERDTreeTabsToggle<CR>

let $PAGER = 'less'
let $LESS = 'dQFe'

let g:nerdtree_tabs_open_on_gui_startup=0

let g:ale_fixers = {'javascript': ['prettier-eslint']}
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5 --no-semi'
let g:airline#extensions#ale#enabled = 1


