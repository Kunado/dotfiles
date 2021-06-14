if &compatible
  set nocompatible
endif

set clipboard=unnamed

let mapleader = "\<Space>"

" encoding config
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,euc-jisx0213,euc-jp,cp932
set fileformats=unix,dos,mac

" general config
set hidden
set noswapfile
set nobackup
set autoread
set wildmenu
set wildmode=list:longest

" edit config
set backspace=indent,eol,start

" indent config
filetype plugin indent on
set autoindent
set smartindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" visual config
set termguicolors
set splitbelow
set splitright
set number
set cursorline
set showcmd
set laststatus=2
set list
set showmatch
set matchpairs& matchpairs+=<:>
set matchtime=3
set wrap
set scrolloff=4
set listchars=tab:>\ ,trail:_,nbsp:@
set ambiwidth=single

" search config
set ignorecase
set hlsearch
set incsearch
set smartcase
set wrapscan
