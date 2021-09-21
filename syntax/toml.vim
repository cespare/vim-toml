" Vim syntax file
" Language:            TOML
" Homepage:            https://github.com/cespare/vim-toml
" Maintainer:          Aman Verma
" Previous Maintainer: Caleb Spare <cespare@gmail.com>
" Last Change:         Oct 8, 2021

if exists('b:current_syntax')
  finish
endif

syn match tomlNoise "[,.]" display nextgroup=@tomlValue skipempty skipwhite

syn match tomlOperator "=" display nextgroup=@tomlValue skipempty skipwhite

syn match tomlEscape /\\[btnfr"/\\]/ display contained
syn match tomlEscape /\\u\x\{4}/ contained
syn match tomlEscape /\\U\x\{8}/ contained

syn match tomlLineEscape /\\$/ contained

" Basic strings
syn region tomlString oneline start=/"/ skip=/\\\\\|\\"/ end=/"/ contains=tomlEscape
" Multi-line basic strings
syn region tomlString start=/"""/ end=/"""/ contains=tomlEscape,tomlLineEscape
" Literal strings
syn region tomlString oneline start=/'/ end=/'/
" Multi-line literal strings
syn region tomlString start=/'''/ end=/'''/

syn match tomlInteger /[+-]\=\<[1-9]\(_\=\d\)*\>/ display
syn match tomlInteger /[+-]\=\<0\>/ display
syn match tomlInteger /[+-]\=\<0x[[:xdigit:]]\(_\=[[:xdigit:]]\)*\>/ display
syn match tomlInteger /[+-]\=\<0o[0-7]\(_\=[0-7]\)*\>/ display
syn match tomlInteger /[+-]\=\<0b[01]\(_\=[01]\)*\>/ display
syn match tomlInteger /[+-]\=\<\(inf\|nan\)\>/ display

syn match tomlFloat /[+-]\=\<\d\(_\=\d\)*\.\d\+\>/ display
syn match tomlFloat /[+-]\=\<\d\(_\=\d\)*\(\.\d\(_\=\d\)*\)\=[eE][+-]\=\d\(_\=\d\)*\>/ display

syn match tomlBoolean /\<\%(true\|false\)\>/ display

" https://tools.ietf.org/html/rfc3339
syn match tomlDate /\d\{4\}-\d\{2\}-\d\{2\}/ display
syn match tomlDate /\d\{2\}:\d\{2\}:\d\{2\}\%(\.\d\+\)\?/ display
syn match tomlDate /\d\{4\}-\d\{2\}-\d\{2\}[T ]\d\{2\}:\d\{2\}:\d\{2\}\%(\.\d\+\)\?\%(Z\|[+-]\d\{2\}:\d\{2\}\)\?/ display

syn match tomlKey /\v\w+[A-Za-z_.-]*(\s*\=)@=/ contains=tomlNoise display

syn region tomlKeyDq oneline start=/\v(^|[{,])\s*\zs"/ end=/"\ze\s*=/ contains=tomlEscape,tomlNoise

syn region tomlKeySq oneline start=/\v(^|[{,])\s*\zs'/ end=/'\ze\s*=/ contains=tomlNoise

syn cluster tomlTableKeys contains=tomlKey,tomlKeyDq,tomlKeySq

syn match tomlTable /\v(^\s*\[?\s*)@<=\[[a-z_\-]+(\.[a-z_\-]+)*\](\s*\]?\s*$)@=/ contains=tomlNoise,@tomlKeys display

syn region tomlTableInline matchgroup=tomlTable start="\V{" end="\V}" contains=ALLBUT,tomlTable transparent

syn cluster tomlValue contains=tomlArray,tomlTableInline,tomlString,tomlInteger,tomlFloat,tomlBoolean,tomlDate,tomlComment

syn match tomlArray /\v[\[\]]/ contains=tomlTable display

syn keyword tomlTodo TODO FIXME XXX BUG contained

syn match tomlComment /#.*/ contains=@Spell,tomlTodo

hi def link tomlArray tomlNoise
hi def link tomlBoolean Boolean
hi def link tomlComment Comment
hi def link tomlDate Constant
hi def link tomlEscape SpecialChar
hi def link tomlFloat Float
hi def link tomlInteger Number
hi def link tomlKey Identifier
hi def link tomlKeyDq tomlKey
hi def link tomlKeySq tomlKey
hi def link tomlLineEscape SpecialChar
hi def link tomlNoise Delimiter
hi def link tomlOperator Operator
hi def link tomlString String
hi def link tomlTable Title
hi def link tomlTodo Todo

syn sync minlines=500

let b:current_syntax = 'toml'

" vim: et sw=2 sts=2
