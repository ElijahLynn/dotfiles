" Show line numbers
set number
set hls
syntax on
autocmd BufNewFile,BufRead *.install  set syntax=php

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
