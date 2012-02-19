set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set number
set colorcolumn=80
let mapleader="\\"
" fix backspace to delete everything properly on all systems
set backspace=indent,eol,start

" commands recognition in RU keyboard layout
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

" storing session data in viminfo
set viminfo='10,\"100,:20,%,n~/.viminfo
" and jump to the previous position in the file when it's open
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

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

" ri_vim tool
let g:ri_vim_tool = 'ri_vim '
nnoremap <Leader>di :call ri#OpenSearchPrompt(0)<CR> " horizontal split
nnoremap <Leader>dI :call ri#OpenSearchPrompt(1)<CR> " vertical split
nnoremap <Leader>dK :call ri#LookupNameUnderCursor()<CR> " keyword lookup 

" This is totally awesome - remap jj to escape in insert mode.  You'll never type jj anyway, so it's great!
inoremap jj <Esc>

" Map quick shortcut to disable highlighting
map <silent> <Leader>h :nohl<CR>
" Shortcut to quickly map a shortcut to run RSpec on the current file, fixing
" file's name
let g:rspec_bin = "rspec"
map <Leader>mr :map <Leader>r :w\\|!<C-R>=g:rspec_bin<CR> <C-R>%<lt>CR><CR>
map <Leader>mf :map <Leader>r :w\\|!<C-R>=g:rspec_bin<CR> -l <C-R>=line(".")<CR> <C-R>%<lt>CR><CR>
" Run RSpec on the current file
map <Leader>RR :w\|!<C-R>=g:rspec_bin<CR> <C-R>%<CR>
" Run RSpec on the whole suite
map <Leader>RA :w\|!<C-R>=g:rspec_bin<CR> spec<CR>

" Ignoring case is a fun trick
set ignorecase

" And so is Artificial Intellegence!
set smartcase

"Status line gnarliness
set laststatus=2
set statusline=%f\ %m%r%h%w\ (%{&ff}){%Y}\ [%l,%v]\ %{fugitive#statusline()}

" Highlighting the current line
set cursorline
" And keeping the cursor in the middle of the screen
set scrolloff=7

" Hiding Fugitive's buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

" Mapping <C-W>d to deleting the buffer, but keeping current layout
map <silent> <C-W>d :BD<CR>

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
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Textile support doesn't get auto-loaded for some reason
autocmd BufRead,BufNewFile *.textile set filetype=textile
" And Coffee. Seems like ftdetect is fucked up
autocmd BufRead,BufNewFile *.coffee.erb set filetype=coffee
autocmd BufRead,BufNewFile *.coffee set filetype=coffee
autocmd BufNewFile,BufRead *Cakefile set filetype=coffee
" And Puppet
autocmd BufRead,BufNewFile *.pp set filetype=puppet

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

" Enable matchit
runtime macros/matchit.vim    

" EasyMotion's colors Solarized-friendly
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

" Syntastic setup
let g:syntastic_echo_current_error=1
let g:syntastic_enable_signs=1
let g:syntastic_enable_highlighting=1
let g:syntastic_auto_loc_list=1
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'passive_filetypes': ['sass']
                           \ }

" Load local overrides file if exists
if filereadable(expand('~')."/.vimrc.local")
  source ~/.vimrc.local
endif
