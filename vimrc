"************************************************************
" /home/mike/.vimrc - VIM Configuration file
"************************************************************
" OS = Linux Mint 17.2 KDE 64-bit (Rafaela)
"************************************************************
" My Personal Customizations - April 10, 2016
"************************************************

set nocompatible
syntax on
filetype on
filetype plugin on
let g:SuperTabDefaultCompletionType = "context"
highlight Pmenu guibg=brown gui=bold 
"color vividchalk
color molokai
set number
set spell spelllang=en_us
set listchars=eol:$,tab:\ \ 
match ErrorMsg /\%>73v.\+/
match ErrorMsg /[^\t]\zs\t\+/
set statusline=%F%m%r%h%w\ [Format=%{&ff}]\ [Type=%y]\ [LEN=%L]
set laststatus=2

"************************************************************************
" Fold Asciidoc files at sections and using nested folds for subsections
"************************************************************************

" compute the folding level
function! AsciidocLevel()
    if getline(v:lnum) =~ '^== .*$'
        return ">1"
    endif
    if getline(v:lnum) =~ '^=== .*$'
        return ">2"
    endif
    if getline(v:lnum) =~ '^==== .*$'
        return ">3"
    endif
    if getline(v:lnum) =~ '^===== .*$'
        return ">4"
    endif
    if getline(v:lnum) =~ '^====== .*$'
        return ">5"
    endif
    if getline(v:lnum) =~ '^======= .*$'
        return ">6"
    endif
    return "="
endfunction
" run the folding level method when asciidoc is here
autocmd Syntax asciidoc setlocal foldexpr=AsciidocLevel()
" enable folding method: expression on asciidoc
autocmd Syntax asciidoc setlocal foldmethod=expr
" start with text unfolded all the way
autocmd BufRead *.adoc normal zR
autocmd BufRead *.asciidoc normal zR
" TODO following does not work as folding is lost up reloading
" autocmd Syntax asciidoc normal zR


"************************************************
" End of Personal Customizations
"************************************************
