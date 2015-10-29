" ken ccao key mapping.vim
" Author: Cao, Chen <ken.ccao@gmail.com>
" Version: 0.1
" Date: April 19, 2009
" Installing: cp it to ~/.vim/plugin
" Usage:
"

" Make sure we run only once
if exists("kc_mapping_loaded")
    finish
endif
let kc_mapping_loaded = 1


imap <c-b> <esc>i
imap <c-f> <esc>la
imap <c-a> <esc>0I
imap <c-e> <esc>$a



"" :set paste
map <F8> :set paste<CR>
map <F9> :set nopaste<CR>

""
nmap <F5> :r !date<cr>kJ

""
nmap <F12> o<cr>Acked-by: Chen Cao <kcao@redhat.com><cr><esc>

nmap <c-h> :bp<cr>

""
"nmap <c-c><c-c> :!gcc -Wall % -o %:r.out<cr>
"imap <f2> <c-r>=strftime("%c")<cr>

cmap <c-a> <home>
cmap <c-e> <end>
cnoremap <c-b> <left>
cnoremap <c-d> <del>
cnoremap <c-f> <right>
cnoremap <c-n> <down>
cnoremap <c-p> <up>

cnoremap <esc><c-b> <s-left>
cnoremap <esc><c-f> <s-right>
