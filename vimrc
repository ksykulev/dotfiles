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
Bundle 'tComment'
Bundle 'mru.vim'
Bundle 'matchit.zip'
Bundle 'ack.vim'
Bundle 'bufexplorer.zip'
Bundle 'ctrlp.vim'
Bundle "pangloss/vim-javascript"
Bundle "StanAngeloff/php.vim"
Bundle "tpope/vim-fugitive"
Bundle "kchmck/vim-coffee-script"
Bundle 'heartsentwined/vim-emblem'
" Bundle 'rstacruz/sparkup'
Bundle 'mustache/vim-mustache-handlebars'
" Bundle 'ngmy/vim-rubocop'
Bundle 'scrooloose/syntastic'
Bundle 'airblade/vim-gitgutter'

filetype plugin indent on

" END VUNDLE


syntax enable

set backspace=indent,eol,start

set hidden                        " Allow buffers with unsaved changes

set nolazyredraw                  " Don't redraw when don't have to

set nostartofline                 " Don't jump to start of line

set wildmenu                      " Command line completion
set wildmode=list:longest         " Complete files like shell

set ignorecase                    " Case-insensitive searching
set smartcase                     " But case-sensitive if expression contains a capital letter

set number                        " Show line numbers
set ruler                         " Show cursor position

set title                         " Set the terminal's title

set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

set laststatus=2
set statusline=%f\                " Show Full Path of file
set statusline+=%2*%m%r%*         " buffer info (modified, read-only etc...)

"set noexpandtab                  " Use tabs for tab key
set expandtab                     " Use spaces for tabs
set shiftwidth=2                  " Indentation
set tabstop=2                     " tabs space is 2
set list                          " Visual whitespace
set listchars=tab:>\ ,trail:.,extends:#,nbsp:.

set incsearch                     " Highlight Incremental searching

set nowrap                        " No wrap duh!

" Folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1
set foldcolumn=1
" autocmd FileType ruby setlocal foldmethod=syntax

"t 1.5
"foldingStartMarker = '^.*\bfunction\s*(\w+\s*)?\([^\)]*\)(\s*\{[^\}]*)?\s*$';
"foldingStopMarker = '^\s*\}';

"t 2.0
"foldingStartMarker = '\{\s*(//.*)?$|\[\s*(//.*)?$|\(\s*(//.*)?$';
"foldingStopMarker = '^\s*\}|^\s*\]|^\s*\)';

let javaScript_fold=1   " JavaScript
let php_folding=1       " PHP
let ruby_fold=1         " Ruby

"" when ~/.vimrc is changed, autoload
autocmd BufWritePost .vimrc source %
" autocmd! BufWritePost .gvimrc source %

" color overrides
:highlight clear SignColumn
:highlight Pmenu ctermfg=White ctermbg=Blue guifg=White ctermbg=Blue
:highlight PmenuSel ctermbg=White guibg=White ctermfg=Blue guifg=Blue
:highlight Search term=reverse ctermbg=Blue guibg=Blue ctermfg=White
:highlight Folded ctermbg=DarkGreen ctermfg=White guibg=DarkGreen guifg=White
:highlight SpecialKey ctermfg=DarkGray
:highlight Visual ctermbg=LightGreen ctermfg=Black
:highlight GitGutterAdd ctermfg=Green guifg=DarkGreen
:highlight GitGutterChange ctermfg=Yellow guifg=DarkYellow
:highlight GitGutterDelete ctermfg=Red guifg=DarkRed
:highlight GitGutterChangeDelete ctermfg=Yellow guifg=DarkYellow

" quick mapping for fuzzyfinder to \o (o for open)
map <Leader>o :FufFile<Enter>
" quick mapping for ctrlp
map <Leader>t :CtrlP<Enter>
let g:ctrlp_map=''                           " Don't use <C-P>, that's mine
let g:ctrlp_working_path_mode = 'ra'         " nearest .git ancestor
let g:ctrlp_max_height = 20                  " ctrlP height
let g:ctrlp_max_files = 0                    " No limit to file search
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = { 'dir': '\v[\/](node_modules)|(\.(git|hg|svn))$', 'file': '\v\.(exe|so|dll|DS_STORE)$' }

" Syntastic
let g:syntastic_ruby_checkers = ['mri', 'rubocop']

" Handles reselection of visual indent/outdent
vmap > >gv
vmap < <gv

" Git-Gutter
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" Because pasting from other applications into vim is stupid
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
filetype indent off
