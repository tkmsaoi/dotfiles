set nobackup

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,ucs-2,cp932,sjis
set fileformat=unix
set fileformats=unix,dos,mac

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smartindent
set autoindent
set smarttab

set incsearch
set hlsearch
set ignorecase
set smartcase
set wrapscan

set ruler
set title
set showmatch
set showmode

set laststatus=2
set statusline=%f
set statusline+=\ %m
set statusline+=\ %r
set statusline+=%=
set statusline+=[%l:%c]
set statusline+=%y
set statusline+=[%{&fileencoding}]
set statusline+=[%{&fileformat}]

set backspace=indent,eol,start

nmap <ESC><ESC> ;nohlsearch<CR><ESC>

syntax enable
