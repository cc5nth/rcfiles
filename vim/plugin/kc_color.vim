" ken ccao color
" Author: Cao, Chen <ken.ccao@gmail.com>
" Version: 0.1
" Date: April 19, 2009
" Installing: cp it to ~/.vim/plugin
" Usage:
"
" this file demostrates how to write a vim plugin.
"

" Make sure we run only once
if exists("kc_color_loaded")
    finish
endif
let kc_color_loaded = 1


highlight OverLength ctermbg=black ctermfg=white guibg=#592929 guifg=#ffffff
match OverLength /\%9999v.\+/

"highlight OutOfRange ctermbg=Black guibg=yellow
"highlight OutOfRange ctermfg=LightGreen guibg=yellow

map <F6> :match OverLength /\%9999v.\+/<cr>
map <F7> :match OverLength /\%80v.\+/<cr>

