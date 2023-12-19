" Author:       Lifepillar
" Maintainer:   Lifepillar
" License:      Distributed under the same terms as Vim itself. See :help license.

let s:cheat40_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')

" Courtesy of Pathogen
function! s:slash() abort
  return !exists("+shellslash") || &shellslash ? '/' : '\'
endfunction


" Split a path into a list. Code from Pathogen.
function! s:split(path) abort
  if type(a:path) == type([]) | return a:path | endif
  if empty(a:path) | return [] | endif
  let split = split(a:path,'\\\@<!\%(\\\\\)*\zs,')
  return map(split,'substitute(v:val,''\\\([\\,]\)'',''\1'',"g")')
endfunction

function! s:add_fname(fname)
  let found = v:false
  for glob in reverse(s:split(&runtimepath))
    for cs in filter(map(filter(split(glob(glob), "\n"), 'v:val !~ "'.a:fname.'"'), 'v:val.s:slash()."'.a:fname.'.txt"'), 'filereadable(v:val)')
      execute "$read" cs
      let found = v:true
    endfor
  endfor
  return found
endfunction

fun! cheat40#open(newtab)
  let name_with_ft = "cheat40_".&ft
  if a:newtab
    tabnew +setlocal\ buftype=nofile\ bufhidden=hide\ nobuflisted\ noswapfile\ winfixwidth
  else
    botright 40vnew +setlocal\ buftype=nofile\ bufhidden=hide\ nobuflisted\ noswapfile\ winfixwidth
  endif
  let found_filetype = s:add_fname(name_with_ft)
  if !found_filetype
    if get(g:, 'cheat40_use_default', 1)
      execute '$read' s:cheat40_dir.s:slash().'cheat40.txt'
    endif
    call s:add_fname("cheat40")
  endif
  norm ggd_
  setlocal foldmethod=marker foldtext=substitute(getline(v:foldstart),'\\s\\+{{{.*$','','')
  execute 'setlocal foldlevel='.get(g:, 'cheat40_foldlevel', 1)
  setlocal concealcursor=nc conceallevel=3
  setlocal expandtab nonumber norelativenumber nospell nowrap textwidth=40
  setlocal foldcolumn=0 sidescrolloff=0
  setlocal fileencoding=utf-8 filetype=cheat40 nomodifiable
  setlocal iskeyword=@,48-57,-,/,.,192-255
  execute "setlocal" "tags=".s:cheat40_dir.s:slash()."tags"
  nnoremap <silent> <buffer> <tab> za
  " nnoremap <silent> <buffer> <tab> <c-w><c-p>
  nnoremap <silent> <buffer> q <c-w><c-p>@=winnr("#")<cr><c-w>c
endf

" vim: nofen
