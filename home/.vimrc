" Vim Runtime Commands file

" Fish support
" https://github.com/dag/vim-fish
if &shell =~# 'fish$'
        set shell=sh
endif

" Pathogen support
" http://www.vim.org/scripts/script.php?script_id=2332
call pathogen#infect() 
syntax on
filetype plugin indent on

" Vim Sensible override
set scrolloff=200

" Show line numbers
set number

" http://stackoverflow.com/a/1878983/292408  
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
