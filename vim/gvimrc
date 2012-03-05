set guifont=Monaco:h12

" Stripping down toolbar in MacVim, with Ctrl+F2 to bring it back if needed
set guioptions-=T
" Remove vertical scrollbars on the left/right sides of the window
set guioptions-=RLrl

map <silent> <Leader><F2> :if &guioptions =~# 'T' <Bar>
                         \set guioptions-=T <Bar>
                    \else <Bar>
                         \set guioptions+=T <Bar>
                    \endif<CR> 
