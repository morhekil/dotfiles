set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set number
let mapleader="\\"

" set auto-indenting
filetype plugin indent on
set autoindent

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

" Map quick shortcut to disable highlighting
map <silent> <Leader>h :nohl<CR>

" Ignoring case is a fun trick
set ignorecase

" And so is Artificial Intellegence!
set smartcase

"Status line gnarliness
set laststatus=2
set statusline=%f\ %m%r%h%w\ (%{&ff}){%Y}\ [%l,%v]\ %{fugitive#statusline()}

" Highlighting the current line
set cursorline

" Hiding Fugitive's buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

syntax on

" Automatically clean up trailing whitespaces for certain filetypes
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre *.rb :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.erb :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.haml :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.sass :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.textile :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.js :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.html :call <SID>StripTrailingWhitespaces()

" Enabling Pathogen.vim for bundles management
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Textile support doesn't get auto-loaded for some reason
au BufRead,BufNewFile *.textile set filetype=textile

" Solarized color theme
let g:solarized_termtrans=1
set background=light
colorscheme solarized

" Setup the proper shell - we prefer rvm-shell, then zsh
if executable('rvm-shell')
  set shell=rvm-shell
elseif executable('zsh')
  set shell=zsh
end

" Folding settings
set foldmethod=syntax
autocmd Syntax c,cpp,vim,xml,html,xhtml,perl,javaScript,ruby,sh,vimsyn normal zR

let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML
