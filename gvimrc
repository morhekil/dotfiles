set guifont=Monaco:h12

" Stripping down toolbar in MacVim, with Ctrl+F2 to bring it back if needed
set guioptions-=T
map <silent> <Leader><F2> :if &guioptions =~# 'T' <Bar>
                         \set guioptions-=T <Bar>
                    \else <Bar>
                         \set guioptions+=T <Bar>
                    \endif<CR> 
