set nocompatible

if has('nvim')
  if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
else
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
endif

function! PlugCond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

call plug#begin('~/.vim/plugged')

" Languages
let g:polyglot_disabled = ['latex', 'c', 'cpp']
Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/c.vim'
Plug 'zplug/vim-zplug'
Plug 'lervag/vimtex'
Plug 'editorconfig/editorconfig-vim'

" Interface
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'

Plug 'neomake/neomake', PlugCond(has('nvim'))
Plug 'neoclide/coc.nvim', PlugCond(has('nvim'), { 'branch': 'release' })

" Utility
Plug 'tyru/caw.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'kana/vim-repeat'
Plug 'myusuf3/numbers.vim'
Plug 'tpope/vim-unimpaired'
Plug 'mattn/emmet-vim'
Plug 'godlygeek/tabular'

" Write!! replacement
Plug 'lambdalisue/suda.vim'

" Colors
Plug 'chriskempson/base16-vim'
Plug 'gosukiwi/vim-atom-dark'

" Snippet
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Include extra plugins
if filereadable(expand("~/.vimrc.local.plugins"))
  source ~/.vimrc.local.plugins
endif


call plug#end()

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
cmap w!! w suda://%

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

" Lower max update time (default is 4000 ms = 4 s)
" Long time leads to noticeable delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Encoding
set encoding=utf-8

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
try
  color atom-dark-256
catch
  " Oh ok then
endtry

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
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

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

" conceallevel toggle
nnoremap <leader>cl :call ConcealLevelToggle()<cr>
function! ConcealLevelToggle()
  if &conceallevel
    setlocal conceallevel=0
  else
    setlocal conceallevel=2
  endif
endfunction

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

"" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

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

" CoC

" A lot of this fails on normal vim, so wrap it in a guard
if has('nvim')
  " Use tab for trigger completion with characters ahead and navigate.
  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
  " other plugin before putting this into your config.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
  " position. Coc only does snippet and additional edit on confirm.
  if has('patch8.1.1068')
    " Use `complete_info` if your (Neo)Vim version supports it.
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
  else
    imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  endif

  " Use `[g` and `]g` to navigate diagnostics
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K to show documentation in preview window.
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Symbol renaming.
  nmap <leader>rn <Plug>(coc-rename)

  " Formatting selected code.
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

  augroup CoCgroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Applying codeAction to the selected region.
  " Example: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap keys for applying codeAction to the current line.
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Apply AutoFix to problem on the current line.
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Introduce function text object
  " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
  xmap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap if <Plug>(coc-funcobj-i)
  omap af <Plug>(coc-funcobj-a)

  " Use <TAB> for selections ranges.
  " NOTE: Requires 'textDocument/selectionRange' support from the language server.
  " coc-tsserver, coc-python are the examples of servers that support it.
  nmap <silent> <TAB> <Plug>(coc-range-select)
  xmap <silent> <TAB> <Plug>(coc-range-select)

  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocAction('format')

  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

  " Add (Neo)Vim's native statusline support.
  " NOTE: Please see `:h coc-status` for integrations with external plugins that
  " provide custom statusline: lightline.vim, vim-airline.
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  " Mappings using CoCList:
  " Show all diagnostics.
  nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
  " Manage extensions.
  nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
  " Show commands.
  nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
  " Find symbol of current document.
  nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
  " Search workspace symbols.
  nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent> <space>j  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
  " Resume latest coc list.
  nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

endif

" Vimtex
let g:vimtex_compiler_progname = 'nvr'
let g:tex_flavor = 'latex'

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

if exists('+inccommand')
  set inccommand=nosplit
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

" HAProxy
augroup Filetype haproxy
  au!
  au Filetype haproxy set ts=4 sw=4
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
