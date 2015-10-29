" kensample01.vim
" Author: Cao, Chen <ken.ccao@gmail.com>
" Version: 0.1
" Date: April 19, 2009
" Installing: cp it to ~/.vim/plugin
" Usage: :KenCmdTest01
"
" this file demostrates how to write a vim plugin.
"

" Make sure we run only once
if exists("kc_sample_1")
    finish
endif
let kc_sample_1 = 1

function KenFuncTest01()
    echo "welcome to enthus' world."
endfunction

"call KenFuncTest01()
"

" 'export the command'
command KenCmdTest01 call KenFuncTest01()


