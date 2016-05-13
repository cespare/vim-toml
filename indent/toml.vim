if exists("b:did_indent")
  finish
endif

let b:did_indent = 1

setlocal sw=2 ts=2 sts=2 et
setlocal indentexpr=GetTomlIndent(v:lnum)
setlocal nosmartindent

" Only define the function once.
if exists('*GetTomlIndent')
  finish
endif

function GetTomlIndent(lnum)
  return 0
endfunction
