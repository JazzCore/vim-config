set nocompatible

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

source ~/.vim/funcs.vim

Bundle 'JazzCore/vundle'
Bundle 'JazzCore/ctrlp-cmatcher'
Bundle 'JazzCore/UltiSnips-Snippets'
Bundle 'JazzCore/vim-hybrid'
Bundle 'JazzCore/vim-python-syntax'
Bundle 'JazzCore/vim-space'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-repeat'
"Bundle 'tpope/vim-vinegar'
" this one sets shiftwidth and tabstop automatically
Bundle 'tpope/vim-sleuth'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/nerdcommenter'
Bundle 'kien/ctrlp.vim'
Bundle 'tacahiroy/ctrlp-funky'
"Bundle 'mileszs/ack.vim'
Bundle 'Raimondi/delimitMate'
Bundle "myusuf3/numbers.vim"
Bundle 'SirVer/ultisnips'
Bundle 'maxbrunsfeld/vim-yankstack'

filetype on " Enable filetype detection
filetype indent on " Enable filetype-specific indenting
filetype plugin on " Enable filetype-specific plugins

" Disable menu translation
set langmenu=none

if has('win32')
    source $VIMRUNTIME/mswin.vim
    behave mswin
endif

" Set directories for temp and swap files.
" Make them manually
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

set undofile
set undolevels=2000
set undoreload=10000

set history=1000                                 " remember more commands and search history

syntax on                                        " syntax highlight
set number                                       " Enable num lines
set autoread                                     " auto read when file is changed from outside

set encoding=utf-8                               " this options breaks menu encoding, so we disabling menu translation
set fileencoding=utf-8
set fencs=utf-8,cp1251,koi8-r,cp866              " encodings by default

set hlsearch                                     " search highlighting

set autoindent                                   " auto indentation
set incsearch                                    " incremental search
set nobackup                                     " no *~ backup files
set copyindent                                   " copy the previous indentation on autoindenting
set ignorecase                                   " ignore case when searching
set smartcase                                    " ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab                                     " insert tabs on the start of a line according to context
set backspace=indent,eol,start                   " allow backspacing over everything in insert mode
set formatoptions+=r                             " automatic formatting: auto insert current comment leader after enter

set hidden                                       " put unsaved buffers in the background

set wrap                                         " don't wrap lines
set linebreak                                    " don't wrap inside word
set tabstop=4                                    " a tab is four spaces
set softtabstop=4                                " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                                    " expand tabs by default (overloadable per file type later)
set shiftwidth=4                                 " number of spaces to use for autoindenting

set foldlevel=100                                " Don't autofold anything (but I can still fold manually)
set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds

set shortmess+=filmnrxoOtTc                       " Abbrev. of messages (avoids 'hit enter'), disable completion messages

"colorscheme mustang
colorscheme hybrid
set background=dark                              " Assume a dark background

highlight clear SignColumn                       " SignColumn should match background for things like vim-gitgutter

set showcmd                                      " Show partial commands in status line and selected characters/lines in visual mode

set scrolloff=3                                  " Minimum lines to keep above and below cursor

set backspace=indent,eol,start                   " Make backspace delete lots of things

set showmatch                                    " show matched braces

set fileformat=unix                              " file mode is unix
set fileformats=unix,dos,mac                     " detects unix, dos, mac file formats in that order

set mousemodel=popup_setpos                      " Right-click on selection should bring up a menu

set list listchars=tab:»·,precedes:<,extends:>   " Make tabs visible. This disables 'wrap'. See g:List_toggle() below

set wildmode=longest,list,full
set wildmenu
set wildignore=*.swp,*.bak,*.pyc,*.pyd,*.class

set pastetoggle=<F2>

set virtualedit=block

set noerrorbells
set novisualbell
set t_vb=
set tm=500

set splitright

set nrformats-=octal

set lazyredraw

"highlight word under cursor
"autocmd CursorMoved * silent! exe printf("match Search /\\<%s\\>/", expand('<cword>'))

if has('gui')
    " disable graphical tabs
    set guioptions-=e
    " disable icons
    set guioptions-=T
    " disable menu
    set guioptions-=m
    if has('win32')
        " This a patched Consolas for Powerline, from
        " https://github.com/nicolalamacchia/powerline-consolas
        set guifont=Consolas:h10
    else
        set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 9
    endif
endif

" Look for tag def in a "tags" file in the dir of the current file, then for
" that same file in every folder above the folder of the current file, until the
" root.
set tags=./tags;/

" Set the status line
set statusline=%<%F " File path
set statusline+=\ %2*%{&ro?'RO':''}%*%4*%{&mod?'+':''}%<%* " RO and modification flags. %2 - red, %4 - green
set statusline+=%3*\ %{matchstr(fugitive#statusline(),'(\\zs.*\\ze)')}%* " Fugitive flag. %3 - orange
set statusline+=%=\ %{&fileformat}\ \| " Remaining items are right-aligned.  File format
set statusline+=%{&fileencoding}\ \| " Encoding
set statusline+=%{&filetype}\ \| " filetype
set statusline+=%p%%\ \| " % of document
set statusline+=%l:%c\  " Line num and col

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" We need to update this colors to match stl background color of the new theme
autocmd ColorScheme * silent! call g:SetSTLColors()

call g:SetSTLColors()

" Highlight trailing whitespace (but not in insert mode)
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
augroup extra_whitespace
  autocmd!
  autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
  autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  autocmd InsertLeave * match ExtraWhitespace /\s\+$/
  autocmd BufWinLeave * call clearmatches()
augroup END

" Filetype-specific settings
autocmd FileType python setlocal colorcolumn=80

" ==================== Mappings ======================
" System default for mappings is now the "," character
let mapleader = ","

nnoremap ; :

" Using '<' and '>' in visual mode to shift code by a tab-width left/right by
" default exits visual mode. With this mapping we remain in visual mode after
" such an operation.
vnoremap < <gv
vnoremap > >gv

nnoremap <silent> j gj
nnoremap <silent> k gk

" Change Working Directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

" Toggle search highlighting
nmap <silent> <leader>/ :set invhlsearch<CR>

" Edit the vimrc file
nmap <silent> ,ev :e $MYVIMRC<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>

" Map <Leader>ff to display all lines with keyword under cursor
" and ask which one to jump to
" TODO ,ff conficts with vim-easymotion
"nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" ,f for global git serach for word under the cursor (with highlight)
"nmap <leader>f :let @/="\\<<C-R><C-W>\\>"<CR>:set hls<CR>:silent Ggrep -w "<C-R><C-W>"<CR>:ccl<CR>:cw<CR><CR>

" Toggle search highlighting
nmap <silent> <leader>/ :set invhlsearch<CR>

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

nnoremap <F1> <ESC>
inoremap <F1> <ESC>
vnoremap <F1> <ESC>

" easily insert an escaped / on the search prompt
"cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'

" map control-backspace to delete the previous word in insert mode
" imap <C-BS> <C-W>
inoremap <C-BS> <C-W>

" and map control-delete to delete the next word in insert mode
inoremap <C-Del> <C-O>dw

nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Make Y consistent with C and D. See :help Y.
nnoremap Y y$

" Unfortunately, visible tabs require 'list', which makes soft word wrap behave
" badly. So it should be toggleable.
noremap <F8> :call g:List_toggle()<CR>
noremap! <F8> <Esc>:call g:List_toggle()<CR>a

" ==================== CtrlP ====================
" funky adds functions definitions mode to CtrlP
let g:ctrlp_extensions = ['tag', 'funky']
let g:ctrlp_custom_ignore = {
    \ 'dir': '\.git$\|\.hg$\|\.svn$',
    \ 'file': '\.exe$\|\.so$\|\.dll$' }

let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ }
\ }

nnoremap <C-l> :CtrlPMRUFiles<CR>

" ==================== TagBar ====================
" toggle Tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on Tagbar open
let g:tagbar_autofocus = 1

" ==================== Fugitive ====================
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>

" ==================== vim-session ====================
let g:session_autosave = 1
let g:session_autoload = 1

" ==================== Ack.vim ====================
" Make ack.vim use Ag (silver searcher ) instead of ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" ==================== UltiSnips ====================
let g:ultisnips_python_style = "sphinx"
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "ultisnips-snippets"]
let g:UltiSnipsDontReverseSearchPath=1
let g:UltiSnipsExpandTrigger = '<C-CR>'
let g:UltiSnipsJumpForwardTrigger = '<C-d>'
let g:UltiSnipsJumpBackwardTrigger = '<C-a>'

" ==================== YouCompleteMe ====================
" Disable completion previews with function prototypes, etc.
set completeopt=menu
let g:ycm_add_preview_to_completeopt = 0
"let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_complete_in_comments_and_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1

" ==================== EasyMotion ====================
" maps: <leader> and f,F,e,E,w,W,ge,gE,j,k,n,N,t,T,b,B
let g:EasyMotion_leader_key="<Leader>"

" ==================== Python-syntax ====================
" Highlight all python syntax
let g:python_highlight_all = 1
