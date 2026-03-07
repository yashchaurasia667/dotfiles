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

noremap m o
noremap M O

noremap o ;

" deleting
noremap dd gg
noremap D G
noremap d g

noremap f e
noremap g t
noremap j y
noremap k n
noremap l u
noremap p r
noremap ; p
noremap r s
noremap s d
noremap t f
noremap u i
noremap D G
noremap E K
noremap F E
noremap G T
noremap I L
noremap J Y
noremap K N
noremap L U
noremap N J
noremap O P
noremap P R
noremap R S
noremap S D
noremap T F

" movement remaps
noremap j n
noremap e k
noremap i l
noremap n j

" insert mode remaps
noremap U I