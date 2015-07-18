set nocompatible
filetype off

call plug#begin('~/.vim/bundle/')
" Languages
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'fatih/vim-go'
Plug 'tpope/vim-markdown'
Plug 'vim-scripts/nginx.vim'
Plug 'rhysd/vim-crystal'

" Interface
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'myusuf3/numbers.vim'
Plug 'majutsushi/tagbar'
Plug 'edkolev/tmuxline.vim'

" Utility
Plug 'tpope/vim-fugitive'
Plug 'xolox/vim-misc'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }

" Colorschemes
Plug 'nanotech/jellybeans.vim'
Plug 'chriskempson/vim-tomorrow-theme'

call plug#end()

filetype plugin indent on

" =======
" Options
" =======

" Update file when changed from the outside
set autoread

" Leader be the comma
let mapleader = ","
let g:mapleader = ","

" Quicksave
nmap <leader>w :w!<cr>

" Sudo write to file
cmap w!! w !sudo tee > /dev/null %

" some scroll spacing
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

" Wildmenu related stuff
set wildmenu
set wildmode=list:longest
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*node_modules/**

" Show current position
set ruler

" Buffers become hidden when abandoned
set hidden

" Backspace tweaks
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

" Search tweaks
set incsearch
set hlsearch
set ignorecase
set smartcase

" Dont redraw while executing macros
set lazyredraw

" Regex magic mode
set magic

" Matching brackets
set showmatch
set mat=2

" Remove the bells and whistles
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" A little margin to the left
set foldcolumn=1

" Enable line numbers
set number
" ================
" Colors and Fonts
" ================

" Enable syntax highlighting
syntax on

" Enable dark background
set background=dark

" Set utf8 as standard encoding
set encoding=utf8

" Enable 256 colormode
set t_Co=256

" Set color theme
color Tomorrow-Night-Eighties

" ===============
" Backup and Undo
" ===============

" Turn backups off
set nobackup
set nowb
set noswapfile

" Persistent undos
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" =======================
" Text, tabs, and indents
" =======================

" Spaces > Tabs
set expandtab

" Smart tab
set smarttab

" by default, 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Linebreak when obsessive
set lbr
set tw=500

" Auto indent
set ai

" Smart indent
set si

" Wrapping
set wrap

" Show EOL and TAB characters
set list
set listchars=tab:▸\ ,eol:¬

" ===========
" Visual mode
" ===========

" Binds * and # for searching for current selection
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" ========
" Movement
" ========

" Ignore wraps for j and k
map j gj
map k gk

" Disable highlight when <leader><cr>
map <silent> <leader><cr> :noh<cr>

" Move through windows wiht C-[jkhl]
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Buffer mappings
map <leader>bd :Bclose<cr>
map <leader>bn :bn<cr>
map <leader>bp :bp<cr>

" Tab mappings
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>

" Opens a tab with current buffer's path
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/<cr>

" Swich CWD to current buffer's path
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify tab switch behaviour
set switchbuf=useopen,usetab,newtab
set stal=2

" Return to position when reopening buffer
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif
" Remember info about open buffers on close
set viminfo^=%

" Arrow keys suck...
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
noremap  <Up>    <NOP>
noremap  <Down>  <NOP>
noremap  <Left>  <NOP>
noremap  <Right> <NOP>

" ===========
" Status line
" ===========

" Always show the status line
set laststatus=2

" Statusline format
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l


" ==========
" GVIM stuff
" ==========

if has("gui_running")
  set guioptions-=T
  set guioptions-=e
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set guioptions-=L
  set t_Co=256
  set guitablabel=%M\ %t
  set guifont=Source\ Code\ Pro\ for\ Powerline:h10
endif

" Enable mouse support (really shouldn't though)
set mouse=a

" ===========
" Command mod
" ===========

" Some quick dirmappings
cno $h e ~/
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>


augroup vimrcEx
  autocmd!
  autocmd! BufRead,BufNewFile *.scss setfiletype sass
augroup END

" =====================
" Plugin Configurations
" =====================

" bufExplorer
let g:bufExplorerDefaultHelp = 0
let g:bufExplorerShowRelativePath = 1
let g:bufExplorerFindActive = 1
let g:bufExplorerSortBy = 'name'
map <leader>o :BufExplorer<cr>


" CTRL-P
let g:ctrlp_working_path_mode = 0
let g:ctrlp_map = '<c-f>'
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.git'
map <c-b> :CtrlPBuffer<cr>
map <leader>p :CtrlP<cr>

" Nerd Tree
map <leader>nn :NERDTreeToggle<cr>
map <leader>nf :NERDTreeFind<cr>

" airline
let g:airline_theme="bubblegum"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" =========
" Languages
" =========

" Python
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

" Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" PHP
autocmd FileType php setlocal shiftwidth=4 tabstop=4

" ================
" Helper functions
" ================

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Don't close window when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

function! CurrentFileDir(cmd)
    return a:cmd . " " . expand("%:p:h") . "/"
endfunc
