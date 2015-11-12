
colorscheme darkblue

syntax on

set nocompatible
set nobackup
set hlsearch

set fencs=utf-8,gbk,big5,gb2312,default,ucs-bom,latin1
"set fenc=utf-8 enc=utf-8 tenc=utf-8


set ts=8
set sw=8
set noexpandtab

""" disable auto indent when pasting
set nopaste

set autoindent
set smartindent


"set showmatch


au FileType python setlocal et ts=4 sw=4 sts=4
au FileType ruby setlocal et ts=2 sw=2 sts=2
au FileType perl set ts=4 sw=4 et sts=4
au FileType sh set ts=4 sw=4 et sts=4
au FileType tex set ts=2 sw=2 et sts=2
au FileType lisp set ts=4 sw=4 et sts=4
au FileType make set ts=8 sw=8 noet
au FileType c set ts=8 sw=8 noet


""""
"set wm=2
"

"set wrap linebreak textwidth=69
if has("autocmd")

    " In text files, always limit the width of text to 68 characters
    autocmd BufRead *.txt set wrap linebreak tw=68
endif

