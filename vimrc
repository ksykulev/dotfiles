set nocompatible 

syntax enable 

filetype plugin indent on

set backspace=indent,eol,start

set hidden

set wildmenu                      " Command line completion
set wildmode=list:longest         " Complete files like shell

set ignorecase                    " Case-insensitive searching
set smartcase                     " But case-sensitive if expression contains a capital letter

set number                        " Show line numbers
set ruler                         " Show cursor position

set title                         " Set the terminal's title
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

set laststatus=2 
