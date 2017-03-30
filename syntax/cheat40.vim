" Author:       Lifepillar
" Maintainer:   Lifepillar
" License:      Distributed under the same terms as Vim itself. See :help license.

if exists("b:current_syntax")
  finish
endif

syntax case ignore
syntax sync fromstart

syn match   Cheat40Descr        /\%1v.*\%<26v./
syn match   Cheat40Command      /\%26v.*\%<41v./ contains=Cheat40Mode,Cheat40Angle,Cheat40DblAngle
syn match   Cheat40Header       /^.*{{{\d*$/ contains=Cheat40BeginSection
syn region  Cheat40About        start=/^About.*{{{\d*$/ end=/^}}}$/ keepend contains=Cheat40BeginSection,Cheat40EndSection,Cheat40Tag,Cheat40Angle,Cheat40DblAngle
syn match   Cheat40FirstLine    /\%1l.*/
syn match   Cheat40BeginSection /{{{\d*/ contained conceal
syn match   Cheat40EndSection   /^}}}$/ conceal
syn match   Cheat40Tag          /`[^` \t]\+`/hs=s+1,he=e-1 contained contains=Cheat40Backtick,Cheat40Runtime
syn match   Cheat40Backtick     /`/ contained conceal
syn match   Cheat40Mode         /[NICVTOM*]\+\%>40v/
syn match   Cheat40Angle        /‹[^› \t]\+›/ contained
syn match   Cheat40DblAngle     /«[^» \t]\+»/ contained
syn match   Cheat40Comment      /^#.*$/ contains=Cheat40Hash
syn match   Cheat40Hash         /^#\s*/ contained conceal
syn match   Cheat40Runtime      /\$VIMRUNTIME\/doc\// contained conceal

hi def link Cheat40Descr        Normal
hi def link Cheat40Command      Constant
hi def link Cheat40Header       Title
hi def link Cheat40About        Comment
hi def link Cheat40FirstLine    Statement
hi def link Cheat40BeginSection Ignore
hi def link Cheat40EndSection   Ignore
hi def link Cheat40Tag          Tag
hi def link Cheat40Backtick     Ignore
hi def link Cheat40Mode         Type
hi def link Cheat40Angle        Identifier
hi def link Cheat40DblAngle     Label
hi def link Cheat40Comment      Comment
hi def link Cheat40Hash         Ignore
hi def link Cheat40Runtime      Ignore

let b:current_syntax = "cheat40"

