" Source: https://realpython.com/vim-and-python-a-match-made-in-heaven/


set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Folding Plugin
Plugin 'tmhedberg/SimpylFold'

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Indentation
Plugin 'vim-scripts/indentpython.vim'

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix
    
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2
    
" Flag bad whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" UTF-8
set encoding=utf-8

" Auto complete
Bundle 'Valloric/YouCompleteMe'

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" set up Virtualenv 
"python with virtualenv support
pyx << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" Syntax checking
Plugin 'vim-syntastic/syntastic'

Plugin 'nvie/vim-flake8'

let python_highlight_all=1
syntax on

" Color schemes
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

call togglebg#map("<F5>")

" File tree
Plugin 'scrooloose/nerdtree'

Plugin 'jistr/vim-nerdtree-tabs'

" Hide .pyc
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Super searching
Plugin 'kien/ctrlp.vim'

" Line numbering
set nu

" Git integration
Plugin 'tpope/vim-fugitive'

" Powerline status bar
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" Use system clipboard
set clipboard=unnamed


