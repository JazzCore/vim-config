set nocompatible

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
"set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
"set rtp+=D:/src/powerline/powerline/bindings/vim
set rtp+=~/.vim/ycmtest/

source ~/.vim/funcs.vim

Bundle 'JazzCore/vundle'
Bundle 'JazzCore/ctrlp-cmatcher'
Bundle 'JazzCore/ultisnips-snippets'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-repeat'
" this one sets shiftwidth and tabstop automatically
Bundle 'tpope/vim-sleuth'
Bundle 'godlygeek/tabular'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'Lokaltog/vim-easymotion'
"Bundle 'Lokaltog/powerline'
Bundle 'majutsushi/tagbar'
Bundle 'kien/ctrlp.vim'
Bundle 'tacahiroy/ctrlp-funky'
Bundle 'mileszs/ack.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'croaker/mustang-vim'
Bundle 'telamon/vim-color-github'
Bundle 'alfredodeza/pytest.vim'
Bundle 'mbbill/undotree'
Bundle 'matthias-guenther/hammer.vim'
Bundle 'Spaceghost/vim-matchit'
Bundle 'gregsexton/gitv'
Bundle 'xolox/vim-session'
Bundle "myusuf3/numbers.vim"
Bundle "klen/python-mode"
Bundle 'Decho'
Bundle 'bufexplorer.zip'
" Check it
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'sjl/clam.vim'
"Bundle 'suan/vim-instant-markdown'
Bundle 'maxbrunsfeld/vim-yankstack'
Bundle 'scrooloose/nerdtree'
Bundle 'sgerrand/Conque-Shell'
Bundle 'terryma/vim-expand-region'
Bundle 'spiiph/vim-space'
Bundle 'airblade/vim-gitgutter'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'xolox/vim-shell'
Bundle 'SirVer/ultisnips'
"Bundle 'Yggdroot/indentLine'
"Bundle 'kien/rainbow_parentheses'
Bundle 'pydave/AsyncCommand'
"Bundle 'Shougo/neocomplcache'
"Bundle 'JazzCore/neocomplcache-ultisnips'

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

set shortmess+=filmnrxoOtT                       " Abbrev. of messages (avoids 'hit enter')

colorscheme mustang
set background=dark                              " Assume a dark background

highlight clear SignColumn                       " SignColumn should match background for things like vim-gitgutter

set showcmd                                      " Show partial commands in status line and selected characters/lines in visual mode

set scrolloff=3                                  " Minimum lines to keep above and below cursor

set backspace=indent,eol,start                   " Make backspace delete lots of things

set showmatch                                    " show matched braces

set fileformat=unix                              " file mode is unix
set fileformats=unix,dos,mac                     " detects unix, dos, mac file formats in that order

set mousemodel=popup_setpos                      " Right-click on selection should bring up a menu

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
set stl=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]
" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

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

nnoremap j gj
nnoremap k gk

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


" ==================== CtrlP ==================== 
" funty adds functions definitions mode to CtrlP
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

" ==================== PyTest ==================== 
" Execute the tests
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
" cycle through test errors
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>

" ==================== TagBar ====================
" toggle Tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on Tagbar open
let g:tagbar_autofocus = 1

" ==================== TaskList ====================
" show pending tasks list
map <F3> :TaskList<CR>

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

" ==================== python-mode ====================
let g:pymode_doc = 0
let g:pymode_run = 0
let g:pymode_lint = 0
let g:pymode_lint_signs = 1
"let g:pymode_lint_signs_always_visible = 1
let g:pymode_lint_onfly = 1
let g:pymode_lint_cwindow = 1
let g:pymode_rope = 0
let g:pymode_folding = 0
let g:pymode_options = 0

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

" ==================== NERDTree ====================
map <F2> :NERDTreeToggle<CR>

" ==================== Powerline ====================
"let g:Powerline_symbols = 'unicode'
let g:Powerline_symbols="fancy"

" ==================== Vim-Gitgutter ====================
let g:gitgutter_on_bufenter = 0

" ==================== indentLine ====================
let g:indentLine_char = "│"

" ==================== RainbowParentheses ====================
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces

" ==================== EasyMotion ====================
" maps: <leader> and f,F,e,E,w,W,ge,gE,j,k,n,N,t,T,b,B
let g:EasyMotion_leader_key="<Leader>"

let g:jedi#auto_initialization = 1
let g:jedi#goto_command = "<leader>g"
let g:jedi#get_definition_command = "<leader>d"
let g:jedi#use_tabs_not_buffers = 0
