set shiftwidth=2
set softtabstop=2
set relativenumber
syntax on

set number
" set wrap
set encoding=utf-8
set mouse=a
set wildmenu
set lazyredraw
set showmatch
set laststatus=2
set ruler

"""" Key Bindings
" move vertically by visual line (don't skip wrapped lines)
" nmap j gj
" nmap k gk

"""" Vim Appearance
" put colorscheme files in ~/.vim/colors/
colorscheme murphy      " good colorschemes: murphy, slate, molokai, badwolf, solarized

" use filetype-based syntax highlighting, ftplugins, and indentation
syntax enable
filetype plugin indent on

"""" Tab settings
set tabstop=2           " width that a TAB character displays as
set expandtab           " convert TAB key-presses to spaces
set shiftwidth=2        " number of spaces to use for each step of (auto)indent
set softtabstop=2       " backspace after pressing TAB will remove up to this many spaces

set autoindent          " copy indent from current line when starting a new line
set smartindent         " even better autoindent (e.g. add indent after '{')


"""" Search settings
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

"""" Miscellaneous settings that might be worth enabling
"set cursorline         " highlight current line
set background=dark    " configure Vim to use brighter colors
set autoread           " autoreload the file in Vim if it has been changed outside of Vim

" movement remaps
noremap j n
noremap e k
noremap i l
noremap n j

noremap dd gg
noremap D G

"searching
noremap f f
noremap F F

noremap t t
noremap T T

noremap o ;
noremap k n

" editing
noremap s d
noremap S D
noremap ss dd

noremap u i
noremap U I

noremap l u
noremap L U

noremap m o
noremap M O

noremap ; p
noremap : P

noremap O :

"vim.cmd("nnoremap j y")
"vim.cmd("nnoremap jj yy")
"vim.cmd("nnoremap J Y")
