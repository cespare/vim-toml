" File: ftplugin/toml.vim
" Author: Kevin Ballard <kevin@sb.org>
" Description: FileType Plugin for Toml
" Last Change: Jan 19, 2019

if exists('b:did_ftplugin')
    finish
endif
let b:did_ftplugin = 1

let s:save_cpo = &cpo
set cpo&vim
let b:undo_ftplugin = 'setlocal commentstring<'

setlocal commentstring=#\ %s

" Add NERDCommenter delimiters

let s:delims = { 'left': '#' }
if exists('g:NERDDelimiterMap')
    if !has_key(g:NERDDelimiterMap, 'toml')
        let g:NERDDelimiterMap.toml = s:delims
    endif
elseif exists('g:NERDCustomDelimiters')
    if !has_key(g:NERDCustomDelimiters, 'toml')
        let g:NERDCustomDelimiters.toml = s:delims
    endif
else
    let g:NERDCustomDelimiters = { 'toml': s:delims }
endif
unlet s:delims

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set et sw=4 ts=4:
