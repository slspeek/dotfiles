set shell=/bin/sh
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

"Bundle 'CoqIDE'
Bundle 'def-lkb/vimbufsync'
Bundle 'the-lambda-church/coquille'
" Javascript related
Bundle 'scrooloose/syntastic'
Bundle 'Shougo/vimproc.vim'
Bundle 'Shougo/vimshell.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'
Bundle 'lukaszb/vim-web-indent'
Bundle 'godlygeek/tabular'
Bundle 'walm/jshint.vim'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'aurigadl/vim-angularjs'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'jsruntime.vim'
"Bundle 'jsoncodecs.vim'
Bundle 'michalliu/jsruntime.vim'
Bundle 'andre-luiz-dos-santos/autocomp'
"Bundle 'Lokaltog/vim-powerline'
"Bundle 'jsflakes.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'L9'
Bundle 'FuzzyFinder'
" Haskell
Bundle 'lukerandall/haskellmode-vim'
" Idris
Bundle 'idris-hackers/idris-vim'


Bundle 'vcscommand.vim'
Bundle 'sjl/threesome.vim'
Bundle 'gregsexton/gitv'
"needs +python build option
" Support for D
"Bundle 'JesseKPhillips/d.vim'

"Python support
Bundle 'davidhalter/jedi-vim'
Bundle 'kevinw/pyflakes-vim'
Bundle 'javacomplete'

Bundle 'buffet.vim'
Bundle 'ScrollColors'
Bundle 'AutoComplPop'
"Bundle 'vim-auto-save'

"Golang
"
"Bundle 'jnwhiteh/vim-golang'
Bundle 'Blackrush/vim-gocode'

" Latex
Bundle 'latex-support.vim'

" Gradle
Bundle 'tfnico/vim-gradle'

let g:Latex_MapLeader=','

" Color schemes
Bundle 'molokai'
Bundle 'Wombat'
Bundle 'Gentooish'
Bundle 'darkspectrum'
Bundle 'oceandeep'


filetype plugin indent on     " required!
filetype plugin on
filetype indent on

set omnifunc=syntaxcomplete#Complete
" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %
autocmd! bufenter *.py :set expandtab
"autocmd! bufenter *.v :CoqIDESetMap
" Maps Coquille commands to <F2> (Undo), <F3> (Next), <F4> (ToCursor)
au FileType coq call coquille#FNMapping()


map <F1> <ESC>
map <F5> :tabprevious<CR>
map <F6> :tabnext<CR>

set ts=2
map <c-s> :w
imap <c-s> :w


" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F12>
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


map <C-\> :NERDTreeFind<CR>



" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype plugin indent on
filetype plugin on
syntax on

" Useful settings
set history=700
set undolevels=700

set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround


set incsearch
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
let g:ctrlp_ignore = 'report .class build'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(build|bin|git|hg|svn)$',
  \ 'file': '\v\.(class|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
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
set undodir=~/undodir
set undofile


:let g:haddock_browser="x-www-browser"
colorscheme delek
autocmd Filetype java setlocal omnifunc=javacomplete#Complete
autocmd Filetype python set ts=4 
autocmd Filetype python set softtabstop=4 
autocmd Filetype python set shiftwidth=4

"map <silent> <F3> :Bufferlist<CR>
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

let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['javascript'],
                           \ 'passive_filetypes': ['html'] }

" To enable this plugin, edit the .vimrc like this:
let g:syntastic_javascript = "closurecompiler"
" and set the path to the Google Closure Compiler:
let g:syntastic_javascript_closure_compiler_path ="$HOME/closure/mfc/node_modules/closure-pro-build/3p/closure-compiler-20130823/compiler.jar"

let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
set tags=$HOME/go/src/tags
"imap <C-0> <C-o>:Import 

map <leader>' <C-w>jzz

inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>
