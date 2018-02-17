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

fun! cheat40#open(newtab)
  if a:newtab
    tabnew +setlocal\ buftype=nofile\ bufhidden=hide\ nobuflisted\ noswapfile\ winfixwidth
  else
    botright 40vnew +setlocal\ buftype=nofile\ bufhidden=hide\ nobuflisted\ noswapfile\ winfixwidth
  endif
  if get(g:, 'cheat40_use_default', 1)
    execute '$read' s:cheat40_dir.s:slash().'cheat40.txt'
  endif
  for glob in reverse(s:split(&runtimepath))
    for cs in filter(map(filter(split(glob(glob), "\n"), 'v:val !~ "cheat40"'), 'v:val.s:slash()."cheat40.txt"'), 'filereadable(v:val)')
      execute "$read" cs
    endfor
  endfor
  norm ggd_
  setlocal foldlevel=1 foldmethod=marker foldtext=substitute(getline(v:foldstart),'\\s\\+{{{.*$','','')
  setlocal concealcursor=nc conceallevel=3
  setlocal expandtab nonumber norelativenumber nospell nowrap textwidth=40
  setlocal fileencoding=utf-8 filetype=cheat40 nomodifiable
  setlocal iskeyword=@,48-57,-,/,.,192-255
  execute "setlocal" "tags=".s:cheat40_dir.s:slash()."tags"
  nnoremap <silent> <buffer> <tab> <c-w><c-p>
  nnoremap <silent> <buffer> q <c-w><c-p>@=winnr("#")<cr><c-w>c
endf
