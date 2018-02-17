" Author:       Lifepillar
" Maintainer:   Lifepillar
" License:      Distributed under the same terms as Vim itself. See :help license.

if exists("g:loaded_cheatsheet") || &cp || v:version < 700
  finish
endif
let g:loaded_cheatsheet = 1

command -bar -nargs=0 -bang Cheat40 call cheat40#open("<bang>" ==# '!')

if mapcheck("<leader>?", "n") == ""
  nmap <unique> <leader>? :<c-u>Cheat40<cr>
endif

