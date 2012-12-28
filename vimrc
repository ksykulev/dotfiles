set nocompatible

" VUNDLE
filetype off                      " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'

filetype plugin indent on

" END VUNDLE


syntax enable

set backspace=indent,eol,start

set hidden                        " Hide buffers when they are abandoned

set wildmenu                      " Command line completion
set wildmode=list:longest         " Complete files like shell

set ignorecase                    " Case-insensitive searching
set smartcase                     " But case-sensitive if expression contains a capital letter

set number                        " Show line numbers
set ruler                         " Show cursor position

set title                         " Set the terminal's title

set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

set laststatus=2

set tabstop=2                     " tabs space is 2
set list                          " Visual whitespace
set listchars=tab:\ \ ,trail:.

set nowrap                        " No wrap duh!

map <Leader>t :FufFile<Enter>
