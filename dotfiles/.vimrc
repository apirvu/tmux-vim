set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
let mapleader = ','
" let vundle manage vundle
Plugin 'gmarik/vundle'
" list all plugins that you'd like to install here
Plugin 'kien/ctrlp.vim' " fuzzy find files
Plugin 'scrooloose/nerdtree' " file drawer, open with :NERDTreeToggle
Plugin 'benmills/vimux'                                                    
Plugin 'tpope/vim-fugitive' " the ultimate git helper                      
Plugin 'tpope/vim-commentary' " comment/uncomment lines with gcc or gc in visual mode
Plugin 'morhetz/gruvbox'
Plugin 'mileszs/ack.vim'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'ervandew/supertab'
Plugin 'jiangmiao/auto-pairs'
call vundle#end()

:silent! colorscheme gruvbox
filetype plugin indent on
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrows=0
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


set ttymouse=xterm2
set mouse=a
set ttyfast
set encoding=utf-8
set hlsearch
set incsearch
set background=dark
set tabstop=4
set shiftwidth=2
set nocompatible
set t_Co=256
syntax on
set omnifunc=syntaxcomplete#Complete
autocmd FileType java setlocal omnifunc=javacomplete#Complete
set nobackup
set nowritebackup
set noswapfile
set number

imap jk <ESC>la
imap jj <ESC><right>

set wildmenu
set wildchar=<TAB>
set wildmode=list:longest
set backspace=indent,eol,start

set pastetoggle=<F10>
map <F7> mzgg=G`z
inoremap <C-p> <F10><C-r>+<F10>
set backspace=indent,eol,start
nmap<leader>p :CtrlP

"Open a new tab and search for something
nmap<leader>A :tab split<CR>:Ack ""<Left>

"Imemdiately search for the word under the cursor in a new tab
nmap<leader>a :tab split<CR>:Ack <C-r><C-w><CR>

imap < <><left>
imap <<space> <<space><space>><left><left>

"Lazy moving lines
"
" Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" Insert mode
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi

" Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
