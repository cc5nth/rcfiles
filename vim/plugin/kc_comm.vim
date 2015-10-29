" ken ccao commands
" Author: Cao, Chen <ken.ccao@gmail.com>
" Version: 0.1
" Date: Aug 21, 2010
" Installing: cp it to ~/.vim/plugin
" Usage:
"

" Make sure we run only once
if exists("kc_comm_loaded")
    finish
endif
let kc_comm_loaded = 1


function KcPasteXX(col)
    exe "set wrap linebreak tw=".a:col
    exe "set nosmartindent"
    exe "set noautoindent"
    exe "set et"
endfunction

function KcLinusIndent()
    exe "set sw=4 ts=4 et"
endfunction


" 'export the command'
command Kcpaste65 call KcPasteXX(65)
command Kcpaste79 call KcPasteXX(79)
command -nargs=1 Kcpaste00 call KcPasteXX(<args>)

command KcLinusIndent call KcLinusIndent()

