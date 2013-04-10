set nocompatible

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
"set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
"set rtp+=D:/src/powerline/powerline/bindings/vim
set rtp+=~/.vim/ycmtest/

Bundle 'JazzCore/vundle'
Bundle 'JazzCore/ctrlp-cmatcher'
Bundle 'JazzCore/ultisnips-snippets'
Bundle 'SirVer/ultisnips'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-markdown'
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
Bundle 'nvie/vim-flake8'
Bundle 'alfredodeza/pytest.vim'
Bundle 'mbbill/undotree'
"Bundle 'sjl/Gundo.vim'
Bundle 'matthias-guenther/hammer.vim'
Bundle 'Spaceghost/vim-matchit'
Bundle 'gregsexton/gitv'
Bundle 'xolox/vim-session'
Bundle "myusuf3/numbers.vim"
Bundle "klen/python-mode"
Bundle 'Decho'
Bundle 'TaskList.vim'
Bundle 'bufexplorer.zip'
" Check it
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'sjl/clam.vim'
Bundle 'suan/vim-instant-markdown'
Bundle 'maxbrunsfeld/vim-yankstack'
Bundle 'tpope/vim-scriptease'
Bundle 'ivanov/vim-ipython'
Bundle 'scrooloose/nerdtree'
Bundle 'sgerrand/Conque-Shell'
Bundle 'terryma/vim-expand-region'
Bundle 'spiiph/vim-space'
Bundle 'airblade/vim-gitgutter'

" Disable menu translation
set langmenu=none

if has('win32')
    "source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin
endif

" Set directories for temp and swap files.
" Make them manually
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

set number
set autoread " auto read when file is changed from outside

" set default encoding to UTF-8. Needed for powerline
" this options breaks menu encoding, so we disabling menu
" translation
set encoding=utf-8

set fencs=utf-8,cp1251,koi8-r,cp866 " encodings by default

filetype on " Enable filetype detection
filetype indent on " Enable filetype-specific indenting
filetype plugin on " Enable filetype-specific plugins

syntax on " syntax highlight
set hlsearch " search highlighting

set autoindent " auto indentation
set incsearch " incremental search
set nobackup " no *~ backup files
set copyindent " copy the previous indentation on autoindenting
set ignorecase " ignore case when searching
set smartcase " ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab " insert tabs on the start of a line according to context
set backspace=indent,eol,start " allow backspacing over everything in insert mode

" Make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

" This makes j and k work on "screen lines" instead of on "file lines"; now, when
" we have a long line that wraps to multiple screen lines, j and k behave as we
" expect them to.
nnoremap j gj
nnoremap k gk

set virtualedit=block

" disable sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500 

set wrap " don't wrap lines
set linebreak " don't wrap inside word
set tabstop=4 " a tab is four spaces
set softtabstop=4 " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab " expand tabs by default (overloadable per file type later)
set shiftwidth=4 " number of spaces to use for autoindenting

" old was darkspectrum
colorscheme mustang 

set background=dark         " Assume a dark background

highlight clear SignColumn " SignColumn should match background for things like vim-gitgutter

set showcmd " Show partial commands in status line and selected characters/lines in visual mode

set scrolloff=3 " Minimum lines to keep above and below cursor

set wildmode=longest,list,full
set wildmenu

set fileencoding=utf-8

" Make backspace delete lots of things
set backspace=indent,eol,start

set showmatch " show matched braces 

set history=1000         " remember more commands and search history

set undofile
set undolevels=2000
set undoreload=10000

set wildignore=*.swp,*.bak,*.pyc,*.class

set pastetoggle=<F2>

" misc settings
set fileformat=unix " file mode is unix
set fileformats=unix,dos,mac " detects unix, dos, mac file formats in that order

" Right-click on selection should bring up a menu
set mousemodel=popup_setpos

nnoremap ; :

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

" Using '<' and '>' in visual mode to shift code by a tab-width left/right by
" default exits visual mode. With this mapping we remain in visual mode after
" such an operation.
vnoremap < <gv
vnoremap > >gv

" Set the status line
set stl=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]
" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" System default for mappings is now the "," character
let mapleader = ","

set foldlevel=100 " Don't autofold anything (but I can still fold manually)
set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds 

set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')

" Change Working Directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

" Turn off that stupid highlight search
nmap <silent> ,n :nohls<CR>

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


" Filetype-specific settings
autocmd FileType python setlocal colorcolumn=80

" ==================== CtrlP ==================== 
" funty adds functions definitions mode to CtrlP
let g:ctrlp_extensions = ['tag', 'funky']

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

" ==================== YouCompleteMe ====================
" Disable completion previews with function prototypes, etc.
"set completeopt=menu
"let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_complete_in_comments_and_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_general_completers = ['ultisnips_completer']

" ==================== NERDTree ====================
map <F2> :NERDTreeToggle<CR>

" ==================== Powerline ====================
"let g:Powerline_symbols = 'unicode'
let g:Powerline_symbols="fancy"
" Temporarily needed for correct powerline work on Windows with
" latest Vim versions
let g:powerline_debugging_pyeval=1
