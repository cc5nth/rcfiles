" ken ccao prog
" Author: Cao, Chen <ken.ccao@gmail.com>
" Version: 0.1
" Date: April 19, 2009
" Installing: cp it to ~/.vim/plugin
" Usage:
"
" this file demostrates how to write a vim plugin.
"

" do not need this, so disable...
let kc_prog_loaded = 1

" Make sure we run only once
if exists("kc_prog_loaded")
    finish
endif
"let kc_prog_loaded = 1


fun SourceBashrc()
    exe "! ls"
endfun

fun LastMod()
    if line("$") > 5
        let l = 5
    else
        let l = line("$")
    endif
    exe "1," . l . "g/# Last modified:/s/# Last modified:.*/# Last modified: " . strftime("%a %b %d, %Y")
endfun


function InsertAuthors()
    let l = line(".") + 1
    exe "normal o"
    call setline(l, '# Author: xxx')
    let l = l + 1
    exe "normal o"
    call setline(l, '# Updated:        ' . strftime("%a %b %d, %Y"))
endfun


function ClosePair(char)
        if getline('.')[col('.') - 1] == a:char
                return "\<Right>"
        else
                return a:char
        endif
endf

function SetClosePair()
    exec ":inoremap ( ()<ESC>i"
    exec ":inoremap ) <c-r>=ClosePair(')')<CR>"
    exec ":inoremap { {}<ESC>i"
    exec ":inoremap } <c-r>=ClosePair('}')<CR>"
    exec ":inoremap [ []<ESC>i"
    exec ":inoremap ] <c-r>=ClosePair(']')<CR>"
    exec ":inoremap < <><ESC>i"
    exec ":inoremap > <c-r>=ClosePair('>')<CR>"
endf


function SetListChars()
    if &encoding == "utf-8"
        set list listchars=tab:»⋅,trail:·,nbsp:⋅
    else
        set listchars=eol:$,trail:-,tab:>-,extends:>,precedes:<
    endif
endf



if has ("autocmd")

    "augroup vdsm
    "    autocmd BufWritePre,FileWritePre runVM.py,CreateVM.py,utils.py,allInOne.py   ks|call VDSMlastmod()|'s
    "augroup END
    "
    "augroup bashrc
    "    autocmd BufLeave,BufWinLeave *bashrc call SourceBashrc()
    "augroup END

    augroup cprog
        au!
        "autocmd BufRead,BufNewFile *.c,*.h match OutOfRange /\%>80v.*/
        autocmd BufRead,BufNewFile *.c,*.h set noexpandtab
        autocmd BufRead,BufNewFile *.c,*.h set textwidth=78
        autocmd BufRead,BufNewFile *.c,*.h set shiftwidth=8
        autocmd BufRead,BufNewFile *.c,*.h set tabstop=8
        autocmd BufRead,BufNewFile *.c,*.h set shiftround
        "autocmd BufNewFile *.c,*.h call setline(1, '/*') |
        "                \ call setline(2, ' * Date : ' . strftime('%a %b %d, %Y')) |
        "                \ call setline(3, ' * Author : xxx') |
        "                \ call setline(4, ' * Last modified: ' . strftime('%c')) |
        "                \ call setline(5, ' */') |
        "                \ call setline(6, '') |
        "                \ execute "normal G"
        "autocmd BufWritePre,FileWritePre *.c,*.h  ks|call CLastMod()|'s
        autocmd BufRead,BufNewFile *.c,*.h call SetClosePair()
    augroup END

    augroup asmprog
        au!
        autocmd BufRead,BufNewFile *.s,*.S set noexpandtab
        autocmd BufRead,BufNewFile *.s,*.S set textwidth=78
        autocmd BufRead,BufNewFile *.s,*.S set shiftwidth=8
        autocmd BufRead,BufNewFile *.s,*.S set tabstop=8
        autocmd BufRead,BufNewFile *.s,*.S set shiftround
        "autocmd BufNewFile *.s,*.S call setline(1, '/*') |
        "                \ call setline(2, ' * Date : ' . strftime('%a %b %d, %Y')) |
        "                \ call setline(3, ' * Author : xxx') |
        "                \ call setline(4, ' * Last modified: ' . strftime('%c')) |
        "                \ call setline(5, ' */') |
        "                \ call setline(6, '') |
        "                \ execute "normal G"
        "autocmd BufWritePre,FileWritePre *.s,*.S    ks|call AsmLastMod()|'s
    augroup END

    augroup mkfile
        au!
        autocmd BufRead,BufNewFile ?akefile set noexpandtab
        autocmd BufRead,BufNewFile ?akefile set textwidth=78
        autocmd BufRead,BufNewFile ?akefile set shiftwidth=8
        autocmd BufRead,BufNewFile ?akefile set tabstop=8
        autocmd BufRead,BufNewFile ?akefile set shiftround
        "autocmd BufRead,BufNewFile ?akefile call SetListChars()

    augroup END

    augroup shs "bash scripts
        au!
        autocmd BufRead,BufNewFile *.sh set tabstop=4
        autocmd BufRead,BufNewFile *.sh set expandtab
        autocmd BufRead,BufNewFile *.sh set shiftwidth=4
        autocmd BufRead,BufNewFile *.sh set shiftround

        autocmd BufRead,BufNewFile *.sh call SetListChars()
    augroup END

    augroup pyprog
        au!
        autocmd BufRead,BufNewFile *.py set tabstop=4
        autocmd BufRead,BufNewFile *.py set expandtab
        autocmd BufRead,BufNewFile *.py set shiftwidth=4
        autocmd BufRead,BufNewFile *.py set shiftround

        autocmd BufRead,BufNewFile *.py call SetListChars()
        "autocmd BufRead,BufNewFile *.py nmap <S-F11> :call ModifiedForOvirtComment()<CR>

        "autocmd BufRead,BufNewFile *.py nmap <S-F12> :call InsertAuthors()<CR>

        autocmd BufNewFile *.py call setline(1, '#!/usr/bin/env python') |
                    \ call setline(2, '') |
                    \ execute "normal G"
        "autocmd BufWritePre,FileWritePre *.py   ks|call LastMod()|'s
        "autocmd BufWritePre,FileWritePre *.py   ks|call VirtLastMod()|'s
    augroup END

    augroup plprog
    autocmd BufNewFile *.pl call setline(1, '#!/usr/bin/perl') |
                \ call setline(2, 'use strict') |
                \ call setline(3, 'use warnings') |
                \ call setline(4, '') |
                \ execute "normal G"
    augroup END

endif
