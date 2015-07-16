set nocompatible
autocmd!
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'L9'

Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'wincent/command-t'

" Colorschemes
Plugin 'sickill/vim-monokai'
Plugin 'nanotech/jellybeans.vim'
Plugin 'jnurmine/zenburn'

Plugin 'kchmck/vim-coffee-script'

Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
call vundle#end()
filetype plugin indent on

set number
set backspace=indent,eol,start
set history=1000
set showcmd
set noshowmode
set cursorline
set visualbell
set autoread

" airline
let g:airline_powerline_fonts = 1
set laststatus=2

set hidden

syntax on

" Let space be the leader
let mapleader=" "
nnoremap <Space> <nop>

set noswapfile
set nobackup
set nowb

if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

set nowrap
set linebreak

set foldmethod=indent
set foldnestmax=3
set nofoldenable

set modeline
set modelines=3

set wildmode=list:longest
set wildmenu
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*node_modules/**

set scrolloff=8
set sidescrolloff=15
set sidescroll=1

set incsearch
set hlsearch
set ignorecase
set smartcase
set showmatch

set mouse=a

augroup vimrcEx
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
  autocmd! BufRead,BufNewFile *.scss setfiletype sass
augroup END

:set t_Co=256
:set background=dark
:color jellybeans
imap <c-c> <esc>
map <c-n> :NERDTreeToggle<CR>
nnoremap <leader><leader> <c-^>

" Sudo write to file
cmap w!! w !sudo tee > /dev/null %
