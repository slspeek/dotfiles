set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
" Javascript related
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'
Bundle 'lukaszb/vim-web-indent'
Bundle 'kchmck/vim-coffee-script'
Bundle 'godlygeek/tabular'
Bundle 'walm/jshint.vim'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'tpope/vim-fugitive'
Bundle 'aurigadl/vim-angularjs'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'jsruntime.vim'
"Bundle 'jsoncodecs.vim'
Bundle 'michalliu/jsruntime.vim'
Bundle 'andre-luiz-dos-santos/autocomp'
Bundle 'Lokaltog/vim-powerline'
"Bundle 'jsflakes.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'L9'
Bundle 'FuzzyFinder'
" Haskell
Bundle 'lukerandall/haskellmode-vim'
Bundle 'vcscommand.vim'
Bundle 'sjl/threesome.vim'
Bundle 'gregsexton/gitv'
Bundle 'tpope/vim-fugitive'
Bundle 'Conque-Shell'
"needs +python build option
" Support for D
Bundle 'JesseKPhillips/d.vim'

"Python support
Bundle 'davidhalter/jedi-vim'
Bundle 'kevinw/pyflakes-vim'
Bundle 'javacomplete'

Bundle 'buffet.vim'
Bundle 'ScrollColors'
Bundle 'AutoComplPop'

"Golang
"
Bundle 'jnwhiteh/vim-golang'
Bundle 'Blackrush/vim-gocode'

" Color schemes
Bundle 'molokai'
Bundle 'Wombat'
Bundle 'Gentooish'
Bundle 'darkspectrum'
Bundle 'oceandeep'


filetype plugin indent on     " required!
filetype plugin on
filetype indent on


set tags=$HOME/projs/nog/tags

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %
autocmd! bufwritepost *.js :JSHint

map <F1> <ESC>
map <F5> :tabprevious<CR>
map <F6> :tabnext<CR>

set ts=2
map <c-s> :w
imap <c-s> :w


" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

set pastetoggle=<F2>
set clipboard=unnamed


" Mouse and backspace
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again

" Quick quit command
"" noremap <Leader>e :quit<CR>  " Quit current window
"" noremap <Leader>E :qa!<CR>   " Quit all windows


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" easier moving between tabs
map <C-\> :NERDTreeToggle<CR>



" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype plugin indent on
filetype plugin on
syntax on

" Useful settings
set history=700
set undolevels=700


" Real programmers don't use TABs but spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

set t_Co=256
au BufEnter *.hs :let g:haddock_indexfiledir="$HOME/.vim/"
au BufEnter *.hs :let b:ghc_staticoptions="-Wall -Werror"
au BufEnter *.hs compiler ghc


set showcmd
set showmode
set backup
set autowrite
set laststatus=2
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/eggs/*
set wildignore+=*/parts/*
set wildignore+=*/coverage/*
set wildignore+=*/node_modules/*
set wildignore+=*/dist/*
set wildignore+=*/eggs/*
set wildignore+=*/parts/*
set wildignore+=*/components/*

" Persistent undo
set undodir=~/.vim/undodir
set undofile

:let g:haddock_browser="x-www-browser"
colorscheme delek
autocmd Filetype java setlocal omnifunc=javacomplete#Complete
autocmd Filetype python set ts=4 
autocmd Filetype python set softtabstop=4 
autocmd Filetype python set shiftwidth=4

map <silent> <F3> :Bufferlist<CR>
map <C-_> :Bufferlist<CR>

autocmd Filetype go map <F4> :Fmt<CR>
autocmd BufEnter *.js map <F4>:call JSBeautify()<CR>
map <C-'> cs"'

function! JSBeautify()
  call inputsave()
  :%!js-beautify -s 2 -f -
  call inputrestore()
endfunction

map <C-n> :tabnew<CR>
map \= F=i:<ESC>
