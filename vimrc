set nocompatible

if has('win32')
    source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin
endif

" make snippets work on win7
" actually this fails. Workaround - append this line to
" vim-snipmate/plugin/snipmate.vim
"if has('win32')
"    source $VIMRUNTIME/bundle/vim-snipmate/after/plugin/snipMate.vim
"endif

call pathogen#infect()

set number
set autoread " auto read when file is changed from outside

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


" disable sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500 

set wrap " don't wrap lines
set tabstop=4 " a tab is four spaces
set softtabstop=4 " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab " expand tabs by default (overloadable per file type later)
set shiftwidth=4 " number of spaces to use for autoindenting

" old was darkspectrum
colorscheme mustang 

set wildmode=longest,list,full
set wildmenu

set fileencoding=utf-8

" Make backspace delete lots of things
set backspace=indent,eol,start

set showmatch " show matched braces 

set history=1000         " remember more commands and search history
set undolevels=2048 " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class

set pastetoggle=<F2>

nnoremap ; :

"highlight word under cursor
"autocmd CursorMoved * silent! exe printf("match Search /\\<%s\\>/", expand('<cword>'))

if has('gui')
    " disable graphical tabs
    set guioptions-=e
    " disable icons
    set guioptions-=T
    if has('win32')
        set guifont=Consolas:h10:cRUSSIAN
    else
        set guifont=Terminus\ 10
    endif
endif

" CtrlP settings
let g:ctrlp_extensions = ['tag']

" Set the status line the way i like it
set stl=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]
" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" System default for mappings is now the "," character
let mapleader = ","

" Turn off that stupid highlight search
nmap <silent> ,n :nohls<CR>

" Edit the vimrc file
nmap <silent> ,ev :e $MYVIMRC<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>

