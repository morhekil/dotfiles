set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set cindent
set autoindent
set number

syntax on

" Enabling Pathogen.vim for bundles management
" filetype off 
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Solarized color theme
set background=light
colorscheme solarized
