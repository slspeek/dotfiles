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
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'jsruntime.vim'
"Bundle 'jsoncodecs.vim'
Bundle 'michalliu/jsruntime.vim'
Bundle 'andre-luiz-dos-santos/autocomp'
Bundle 'Lokaltog/vim-powerline'
"Bundle 'jsflakes.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'kien/ctrlp.vim'
" vim-scripts repos
Bundle 'ton/vim-bufsurf'
Bundle 'L9'
Bundle 'FuzzyFinder'
" Haskell
Bundle 'lukerandall/haskellmode-vim'
"Bundle 'ujihisa/neco-ghc'
"Bundle 'haskell.vim'
Bundle 'vcscommand.vim'
Bundle 'sjl/threesome.vim'
Bundle 'gregsexton/gitv'
Bundle 'tpope/vim-fugitive'
Bundle 'Conque-Shell'
"needs +python build option

"Python support
Bundle 'davidhalter/jedi-vim'
Bundle 'kevinw/pyflakes-vim'
Bundle 'javacomplete'
Bundle 'buffet.vim'
Bundle 'ScrollColors'
Bundle 'AutoComplPop'
" Color schemes
Bundle 'molokai'
Bundle 'Wombat'
Bundle 'Gentooish'
Bundle 'darkspectrum'
Bundle 'oceandeep'


filetype plugin indent on     " required!
filetype plugin on
filetype indent on


function! Google()
	call inputsave()
	let searchterm = input('Search for: ')
	call inputrestore()
	return searchterm
endfunction
map <F3> <ESC>:! /usr/bin/chromium-browser 'https://duckduckgo.com/?q=<C-R>=Google()<CR>'<CR><CR>
iabbr jdesc describe('name', function() {});
iabbr jit it('should', function() {	expect(true).toBe(false);});
set tags=tags;/

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %
autocmd! bufwritepost *.js :JSHint

map <F6> :w:!cabal install && cd src/webapp/dist && iconserver 
map <F7> :w:!ghci %
map <F8> :w:make

map <F9> :w:!./one.sh

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
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>



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
colorscheme oceandeep
map <C-h> :JSHint
autocmd Filetype java setlocal omnifunc=javacomplete#Complete
autocmd Filetype pyhton set ts=4 
autocmd Filetype pyhton set softtabstop=4 
autocmd Filetype pyhton set shiftwidth=4

map <silent> <F3> :Bufferlist<CR>
map <C-_> :Bufferlist<CR>
