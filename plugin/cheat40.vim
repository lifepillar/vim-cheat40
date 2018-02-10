" Author:       Lifepillar
" Maintainer:   Lifepillar
" License:      Distributed under the same terms as Vim itself. See :help license.

if exists("g:loaded_cheatsheet") || &cp || v:version < 700
  finish
endif
let g:loaded_cheatsheet = 1

nnoremap <script> <silent> <plug>Cheat40Open :<c-u>call cheat40#open()<cr>
command Cheat :call cheat40#open_new_tab()<cr>

if !hasmapto('<plug>Cheat40Open', 'n')
  nmap <unique> <leader>? <plug>Cheat40Open
endif

