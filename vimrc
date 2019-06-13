set nocompatible

" VUNDLE
filetype off                      " required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'

" vim-scripts repos
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'tComment'
Plugin 'mru.vim'
Plugin 'matchit.zip'
Plugin 'ack.vim'
Plugin 'bufexplorer.zip'
Plugin 'ctrlp.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'StanAngeloff/php.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'kchmck/vim-coffee-script'
Plugin 'heartsentwined/vim-emblem'
" Plugin 'rstacruz/sparkup'
Plugin 'mustache/vim-mustache-handlebars'
" Plugin 'ngmy/vim-rubocop'
Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'fatih/vim-go'
Plugin 'vim-airline/vim-airline'

call vundle#end()
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
set autoindent                    " next line to automatically be indented
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

noremap <Leader>[ gT
noremap <Leader>] gt
" quick mapping for fuzzyfinder to \o (o for open)
map <Leader>o :FufFile<Enter>
" quick mapping for ctrlp
map <Leader>t :CtrlP<Enter>
let g:ctrlp_map=''                           " Don't use <C-P>, that's mine
let g:ctrlp_working_path_mode = 'ra'         " nearest .git ancestor
let g:ctrlp_max_height = 20                  " ctrlP height
let g:ctrlp_max_files = 0                    " No limit to file search
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = { 'dir': '\v[\/](node_modules|log|public\/uploads)|(\.(git|hg|svn))$', 'file': '\v\.(exe|so|dll|DS_STORE)$' }

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

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_close_button = 0
