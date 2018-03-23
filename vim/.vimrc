set nocompatible

if has('nvim')
  set runtimepath+=~/.nvim/dein/repos/github.com/Shougo/dein.vim
  let base = '~/.nvim'
else
  set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
  let base = '~/.vim'
end

" Inspired by vim-bootstrap
let dein_readme=expand(base . '/dein/repos/github.com/Shougo/dein.vim/README.md')
if !filereadable(dein_readme)
  echo "Installing dein.vim..."
  echo ""
  if has('nvim')
    silent !mkdir -p ~/.nvim/dein/repos/github.com/Shougo/dein.vim
    silent !git clone https://github.com/Shougo/dein.vim.git ~/.nvim/dein/repos/github.com/Shougo/dein.vim
  else
    silent !mkdir -p ~/.vim/dein/repos/github.com/Shougo/dein.vim
    silent !git clone https://github.com/Shougo/dein.vim.git ~/.vim/dein/repos/github.com/Shougo/dein.vim
  end

  if !has('nvim')
    echo "Installing vimproc..."
    call dein#begin(expand(base . '/dein'))
    call dein#add('Shougo/dein.vim')
    call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
    call dein#end()
    call dein#install()
  endif


  let g:not_finished_dein = "yes"
endif

if dein#load_state(expand(base . '/dein'))
  call dein#begin(expand(base . '/dein'))

  " Package manager
  call dein#add('Shougo/dein.vim')

  " Languages
  call dein#add('sheerun/vim-polyglot')
  call dein#add('vim-scripts/c.vim',
        \{'on_ft': ['c', 'cpp']})
  call dein#add('jelera/vim-javascript-syntax',
        \{'on_ft': 'javascript'})
  call dein#add('fatih/vim-go')
  call dein#add('nsf/gocode')
  call dein#add('zplug/vim-zplug')
  call dein#add('chase/vim-ansible-yaml')


  " Interface
  call dein#add('scrooloose/nerdtree')
  call dein#add('jistr/vim-nerdtree-tabs.git')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('majutsushi/tagbar')
  call dein#add('junegunn/fzf', { 'build': './install --bin' })
  call dein#add('junegunn/fzf.vim')
  call dein#add('mileszs/ack.vim')

  if has ('nvim')
    call dein#add('shougo/deoplete.nvim')
    call dein#add('neomake/neomake')
  else
    call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
    call dein#add('shougo/vimshell.vim')
    call dein#add('scrooloose/syntastic')
  endif

  " Utility
  call dein#add('tyru/caw.vim')
  call dein#add('tpope/vim-fugitive')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('Yggdroot/indentLine')
  call dein#add('xolox/vim-misc')
  call dein#add('xolox/vim-session')
  call dein#add('tpope/vim-surround')
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  call dein#add('easymotion/vim-easymotion')
  call dein#add('kana/vim-repeat')
  call dein#add('myusuf3/numbers.vim')
  call dein#add('tpope/vim-unimpaired')

  " Colors
  call dein#add('chriskempson/vim-tomorrow-theme')
  call dein#add('gosukiwi/vim-atom-dark')

  " Include extra plugins
  if filereadable(expand("~/.vimrc.local.plugins"))
    source ~/.vimrc.local.plugins
  endif

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
end

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

" Sudo write
cmap w!! w !sudo tee >/dev/null %

" Scroll spacing
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

" Disable blinking cursor
set gcr=a:blinkon0

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

" Show matching brackets
set showmatch
set mat=2

" Removes the bells and whistles
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" A little margin to the left
set foldcolumn=1

" Enable line numbers
set number

" Set 80-char column
set colorcolumn=80

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

set bomb
set binary
set ttyfast

set fileformats=unix,dos,mac
set showcmd

" ================
" Colors and Fonts
" ================

" Syntax highlighting
syntax on

" Enable dark background
set background=dark

" Enable 256 colormode
set t_Co=256

" Set color theme
color Tomorrow-Night-Eighties

" Mouse tweak
set mousemodel=popup

" ================
" Backups and Undo
" ================

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

" Spaces > tabs
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
set nowrap

" Show EOL and TAB characters
set list
set listchars=tab:▸\ ,trail:·,eol:¬

" Remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" Remove trailing tabs
autocmd BufWritePre * :%s/\t\+$//e

" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

" ====
" GVIM
" ====

if has("gui_running")
  set guioptions=egmrti
  set guitablabel=%M\ %t
endif

" Enable mouse support (really shouldn't though)
set mouse=a

" ===========
" Status line
" ===========

" Always show the status line
set laststatus=2

" Statusline format
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" Use modeline overrides
set modeline
set modelines=10

" Shell title
set title
set titleold="Terminal"
set titlestring=%F

" Fix for Konsole fucking up with gui cursors over SSH
set guicursor=

" ========
" Bindings
" ========

" Ignore wraps for j and k
nnoremap j gj
nnoremap k gk

" Disable search highlight
nnoremap <silent> <leader><cr> :noh<cr>
nnoremap <silent> <leader><space> :noh<cr>

" Move through windows wiht C-[jkhl]
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" Buffer mappings
nnoremap <leader>bd :bd<cr>
nnoremap <leader>bn :bn<cr>
nnoremap <leader>bp :bp<cr>

" Tab mappings
nnoremap <leader>tc :tabnew<cr>
nnoremap <leader>to :tabonly<cr>
nnoremap <leader>td :tabclose<cr>
nnoremap <leader>tm :tabmove<cr>
nnoremap <leader>tn gt
nnoremap <leader>tp gT

" Fat finger fixes
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" Retain visual mode after > and <
vmap < <gv
vmap > >gv

" Move visual block
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv

" Dirmappings
cno $h e ~/
cno $je ./

" Specify tab switch behaviour
set switchbuf=useopen,usetab,newtab
set stal=2

" Sessions
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<cr>
nnoremap <leader>sc :CloseSession<cr>

" Cd to current file
nnoremap <leader>. :lcd %:p:h<cr>

" Nerdtree
nnoremap <leader>nn :NERDTreeToggle<cr>
nnoremap <leader>nf :NERDTreeFind<cr>

" Quickfix
nnoremap \x :cclose<CR>

" =====================
" Plugin Configurations
" =====================

" easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-overwin-f)
nmap S <Plug>(easymotion-overwin-f2)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)

" deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" vim-session
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

" fzf
nmap ; :Buffers<CR>
nmap <Leader>p :Files<CR>
nmap <Leader>r :Tags<CR>

" tagbar
nmap <Leader>' :Tagbar<CR>

" Ack.vim
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif
nmap <M-k> :Ack "\b<cword>\b" <CR>
nmap <Esc>k :Ack "\b<cword>\b" <CR>

" Nerd Tree
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50

" Airline
let g:airline_theme= "jellybeans"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1


" vimshell
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '

if has('nvim')
  nnoremap <silent> <leader>sh :terminal<CR>
else
  nnoremap <silent> <leader>sh :VimShellCreate<CR>
endif

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1

" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_char = '┆'
let g:indentLine_faster = 1
let g:indentLine_color_term = 237
let g:indentLine_color_gui = '#333333'

" Deoplete
let g:deoplete#enable_at_startup = 1


" =============
" AutoCMD rules
" =============

"" The PC is fast enough, do syntax highlight syncing from start
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync fromstart
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END


" Git commit messages should go to start
augroup vimrc-git-cursor-jumpback
  autocmd!
  autocmd BufReadPost COMMIT_EDITMSG exe "normal! gg"
augroup END

" Neomake
if has('nvim')
  autocmd! BufWritePost * Neomake
end

" =================
" Language specific
" =================

" Go
augroup FileType go
  au!
  au FileType go nmap gd <Plug>(go-def)
  au FileType go nmap <Leader>dd <Plug>(go-def-vertical)

  au FileType go nmap <Leader>dv <Plug>(go-doc-vertical)
  au FileType go nmap <Leader>db <Plug>(go-doc-browser)

  au FileType go nmap <Leader>gi <Plug>(go-info)

  au FileType go nmap <leader>gr <Plug>(go-run)
  au FileType go nmap <leader>rb <Plug>(go-build)
  au FileType go nmap <leader>gt <Plug>(go-test)

  au BufWritePre *.go :GoImports
augroup END

let g:tagbar_type_go = {
      \ 'ctagstype' : 'go',
      \ 'kinds'     : [  'p:package', 'i:imports:1', 'c:constants', 'v:variables',
      \ 't:types',  'n:interfaces', 'w:fields', 'e:embedded', 'm:methods',
      \ 'r:constructor', 'f:functions' ],
      \ 'sro' : '.',
      \ 'kind2scope' : { 't' : 'ctype', 'n' : 'ntype' },
      \ 'scope2kind' : { 'ctype' : 't', 'ntype' : 'n' },
      \ 'ctagsbin'  : 'gotags',
      \ 'ctagsargs' : '-sort -silent'
      \ }

" Java
augroup Filetype java
  au!
  au FileType java set ts=4 sw=4
augroup END

" C(like)
augroup Filetype c
  au!
  au FileType c set ts=4 sw=4
  au FileType cpp set ts=4 sw=4
augroup END

" Volt
augroup vimrc-volt
  au!
  au BufNewFile,BufRead *.volt setlocal filetype=jinja2
augroup END

" Ruby
augroup vimrc-ruby
  au!
  au BufNewFile,BufRead *.rb,*.rbw,*.gemspec setlocal filetype=ruby
augroup END

let g:tagbar_type_ruby = {
      \ 'kinds' : [
      \ 'm:modules',
      \ 'c:classes',
      \ 'd:describes',
      \ 'C:contexts',
      \ 'f:methods',
      \ 'F:singleton methods'
      \ ]
      \ }

" Php
augroup Filetype php
  au!
  au Filetype php set ts=4 sw=4
augroup END


" ============
" Override VIM
" ============

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" Set the correct symbols for airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif
