set expandtab
set number
set colorcolumn=80
let mapleader="\\"
" fix backspace to delete everything properly on all systems
set backspace=indent,eol,start

" default indentation
set shiftwidth=2
set tabstop=2
set softtabstop=2
" and custom ones per file type
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4

" Golang settings
autocmd FileType go setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4

" commands recognition in RU keyboard layout
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

" storing session data in viminfo
set viminfo='10,\"100,:20,%,n~/.viminfo
" and jump to the previous position in the file when it's open
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

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
inoremap kk <Esc>

" Ack word under cursor
noremap <Leader>aa :Ack! <cword><CR>
" and ack plugin switched to ag
let g:ackprg = 'ag --nogroup --nocolor --column'

" Map quick shortcut to disable highlighting
map <silent> <Leader>h :nohl<CR>
" Shortcut to quickly map a shortcut to run RSpec on the current file, fixing
" file's name
" let g:rspec_bin = "rspec"
" map <Leader>mr :map <Leader>r :w\\|!<C-R>=g:rspec_bin<CR> <C-R>%<lt>CR><CR>
" map <Leader>mf :map <Leader>r :w\\|!<C-R>=g:rspec_bin<CR> -l <C-R>=line(".")<CR> <C-R>%<lt>CR><CR>
" " Run RSpec on the current file
" map <Leader>RR :w\|!<C-R>=g:rspec_bin<CR> <C-R>%<CR>
" " Run RSpec on the whole suite
" map <Leader>RA :w\|!<C-R>=g:rspec_bin<CR> spec<CR>

" Quick delete for all buffers
map <Leader>bd :1,9999bd<CR>

" cycle through the buffers
map <C-h> :bprev<CR>
map <C-l> :bnext<CR>

" Ignoring case is a fun trick
set ignorecase
" And so is Artificial Intellegence!
set smartcase

"Status line gnarliness
set laststatus=2
set statusline=%f\ %m%r%h%w\ (%{&ff}){%Y}\ [%l,%v]

" Highlighting the current line
set cursorline
" And keeping the cursor in the middle of the screen
set scrolloff=7
" Don't move cursor to the start of the line on G and similar movements
set nostartofline

" Mapping <C-W>d to deleting the buffer, but keeping current layout
map <silent> <C-W>d :BD<CR>

" Automatically clean up trailing whitespaces for certain filetypes
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre *.py :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.rb :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.erb :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.haml :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.hamlbars :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.sass :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.textile :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.js :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.html :call <SID>StripTrailingWhitespaces()

" set sh syntax highlighting for yrules files
au BufRead,BufNewFile yrules set filetype=sh

" Enabling Pathogen.vim for bundles management
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#incubate()
call pathogen#helptags()

" this needs to be AFTER pathogen init, to let it see all pathogen's bundles
syntax on
filetype plugin indent on
set autoindent

" Textile support doesn't get auto-loaded for some reason
autocmd BufRead,BufNewFile *.textile set filetype=textile
" And Coffee. Seems like ftdetect is fucked up
autocmd BufRead,BufNewFile *.coffee.erb set filetype=coffee
autocmd BufRead,BufNewFile *.coffee set filetype=coffee
autocmd BufNewFile,BufRead *Cakefile set filetype=coffee
" And Puppet
autocmd BufRead,BufNewFile *.pp set filetype=puppet
" Hamlbars
autocmd BufRead,BufNewFile *.hamlbars set filetype=haml

" Solarized color theme
let g:solarized_termtrans=1
let g:solarized_bold=1
set background=light
colorscheme solarized

" zsh is our shell
set shell=zsh

" Folding settings
set foldmethod=manual

" Disable arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Enable matchit
runtime macros/matchit.vim

" EasyMotion's colors Solarized-friendly
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

" FuzzyFinder's mappings
map <Leader>ff :FufCoverageFile<CR>
map <Leader>fr :FufMruFile<CR>

" CtrlP to quickly find a buffer or MRU files
map <c-p><c-m> :CtrlPMRU<CR>
map <c-p><c-b> :CtrlPBuffer<CR>
map <c-p><c-f> :CtrlP<CR>
map <c-p><c-x> :CtrlPMixed<CR>
" and some settings for listing files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip  " MacOSX/Linux
let g:ctrlp_working_path_mode = 'rc' " p_r_oject root, or _c_urrent file's dir
let g:ctrlp_custom_ignore = '\.git\|vendor'

" %% to quickly access current file's directory
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%
map <c-p><c-p> :CtrlP %%<CR>

" Load local overrides file if exists
if filereadable(expand('~')."/.vimrc.local")
  source ~/.vimrc.local
endif
" Load per-directory overrides file if exists
if filereadable("./.vimrc.dir")
  source ./.vimrc.dir
endif

" Ruby hash syntax converter
function! s:ChangeHashSyntax(line1,line2)
    let l:save_cursor = getpos(".")
    silent! execute ':' . a:line1 . ',' . a:line2 . 's/:\([a-z0-9_]\+\)\s\+=>/\1:/g'
    call setpos('.', l:save_cursor)
endfunction
command! -range=% ChangeHashSyntax call <SID>ChangeHashSyntax(<line1>,<line2>)
