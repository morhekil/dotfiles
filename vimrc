set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set number

" set auto-indenting
filetype plugin indent on
" set cindent
" set autoindent

" turn off compatibility with the old vi
set nocompatible

" turn on the "visual bell" - which is much quieter than the "audio blink"
set vb

" Incremental searching is sexy
set incsearch

" Highlight things that we find with the search
set hlsearch

" This is totally awesome - remap jj to escape in insert mode.  You'll never type jj anyway, so it's great!
inoremap jj <Esc>

" Ignoring case is a fun trick
set ignorecase

" And so is Artificial Intellegence!
set smartcase

"Status line gnarliness
set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

syntax on

" Enabling Pathogen.vim for bundles management
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Solarized color theme
let g:solarized_termtrans=1
set background=light
colorscheme solarized
