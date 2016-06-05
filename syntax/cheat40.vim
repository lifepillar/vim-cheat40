" Author:       Lifepillar
" Maintainer:   Lifepillar
" License:      Distributed under the same terms as Vim itself. See :help license.

if exists("b:current_syntax")
  finish
endif

syntax case ignore
syntax sync fromstart

syn match   CheatsheetComment      "\%1v.*\%<25v"
syn match   CheatsheetCommand      "\%26v.*\%40v" contains=CheatsheetMode
syn match   CheatsheetHeader       "^.*{{{\d*$" contains=CheatsheetBeginSection
syn region  CheatsheetAbout        start="^About.*{{{2$" end="^}}}$" keepend contains=CheatsheetBeginSection,CheatsheetEndSection
syn match   CheatsheetFirstLine    "\%1l.*"
syn match   CheatsheetBeginSection "{{{\d*" conceal contained
syn match   CheatsheetEndSection   "^}}}$" conceal
syn match   CheatsheetMode         "[NICVTOM*]\+\%>40v"

hi def link CheatsheetComment   Normal
hi def link CheatsheetCommand   Constant
hi def link CheatsheetHeader    Title
hi def link CheatsheetAbout     Comment
hi def link CheatsheetFirstLine Statement
hi def link CheatsheetMode      Label

let b:current_syntax = "cheat40"

