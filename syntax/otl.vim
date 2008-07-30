" Syntax highlighting for outliner.
" Maintainer: Ned Konz <vim@bike-nomad.com>
" $Id: otl.vim 104 2005-01-25 20:36:38Z ned $
"
syn cluster vikiHyperLinks contains=vikiLink,vikiExtendedLink,vikiURL,vikiInexistentLink

syn match otlText /^\t*|.*/               contains=@vikiHyperLinks,otlTagDef,otlTagRef,otlTextLeader display nextgroup=otlText
syn match otlTab9 /^\t\{9}[^\t|].*/       contains=@vikiHyperLinks,otlTagDef,otlTagRef display nextgroup=otlTab9,otlTab8,otlText
syn match otlTab8 /^\t\{8}[^\t|].*/       contains=@vikiHyperLinks,otlTagDef,otlTagRef display nextgroup=otlTab8,otlTab9,otlTab7,otlText
syn match otlTab7 /^\t\{7}[^\t|].*/       contains=@vikiHyperLinks,otlTagDef,otlTagRef display nextgroup=otlTab7,otlTab8,otlTab6,otlText
syn match otlTab6 /^\t\{6}[^\t|].*/       contains=@vikiHyperLinks,otlTagDef,otlTagRef display nextgroup=otlTab6,otlTab7,otlTab5,otlText
syn match otlTab5 /^\t\{5}[^\t|].*/       contains=@vikiHyperLinks,otlTagDef,otlTagRef display nextgroup=otlTab5,otlTab6,otlTab4,otlText
syn match otlTab4 /^\t\{4}[^\t|].*/       contains=@vikiHyperLinks,otlTagDef,otlTagRef display nextgroup=otlTab4,otlTab5,otlTab3,otlText
syn match otlTab3 /^\t\{3}[^\t|].*/       contains=@vikiHyperLinks,otlTagDef,otlTagRef display nextgroup=otlTab3,otlTab4,otlTab2,otlText
syn match otlTab2 /^\t\{2}[^\t|].*/       contains=@vikiHyperLinks,otlTagDef,otlTagRef display nextgroup=otlTab2,otlTab3,otlTab1,otlText
syn match otlTab1 /^\t\{1}[^\t|].*/       contains=@vikiHyperLinks,otlTagDef,otlTagRef display nextgroup=otlTab1,otlTab2,otlTab0,otlText
syn match otlTab0 /^[^\t|].*/             contains=@vikiHyperLinks,otlTagDef,otlTagRef display nextgroup=otlTab0,otlTab1,otlText
syn match otlTextLeader /^\t*|/   contained

"syn match otlWaiting /^\t*\. .*/            contains=@vikiHyperLinks,otlTagDef,otlTagRef,otlWaitingLeader display nextgroup=otlWaiting
syn match otlWaitingLeader /^\t*\. / " contained
syn match otlTodo /^\t*\* .*/            contains=@vikiHyperLinks,otlTagDef,otlTagRef,otlTodoLeader display nextgroup=otlTodo
syn match otlTodoLeader /^\t*\* / contained 

if exists("g:otl_use_viki") && g:otl_use_viki
  syn match otlTagRef  /<[Uu][Rr][Ll]:[^>]\+>/     contained
  syn match otlTagDef  /\<[Ii][Dd]=\w\+>/          contained
else
  syn match otlTagRef  /<[Uu][Rr][Ll]:[^>]\+>\|\[[^]]*]/    contained
  syn match otlTagDef  /\<[Ii][Dd]=\w\+>\|\[\[[^]]*]]/      contained
end

"hi def otlWaiting ctermfg=4 term=reverse ctermbg=none
hi def otlTodo ctermfg=0 term=reverse ctermbg=3
hi def otlWaitingLeader ctermfg=blue term=reverse ctermbg=none
"hi def otlTodoLeader ctermfg=3 term=reverse ctermbg=5

hi def otlTagRef ctermbg=none ctermfg=3 
hi def otlTagDef ctermbg=none ctermfg=3 
hi def otlTextLeader guifg=darkgrey ctermfg=7


" Default is to have bold headers
if !exists("g:otl_bold_headers")
  let g:otl_bold_headers = 1
endif

" Gerolf's colors
hi def otlTab0 ctermfg=1 guifg=red term=reverse
hi def otlTab1 ctermfg=2 guifg=darkgreen term=reverse
hi def otlTab2 ctermfg=3 guifg=brown term=reverse
hi def otlTab3 ctermfg=5 guifg=darkmagenta term=reverse
hi def otlTab4 ctermfg=6 guifg=darkcyan term=reverse
hi def otlTab5 ctermfg=1 guifg=red term=reverse
hi def otlTab6 ctermfg=4 guifg=blue term=reverse
hi def otlTab7 ctermfg=4 guifg=blue term=reverse
hi def otlTab8 ctermfg=4 guifg=blue term=reverse
hi def otlTab9 ctermfg=4 guifg=blue term=reverse

"if g:otl_bold_headers
"  hi def otlTab0 ctermfg=1 cterm=bold gui=bold guifg=red term=reverse
"  hi def otlTab1 ctermfg=4 cterm=bold gui=bold guifg=blue term=reverse
"  hi def otlTab2 ctermfg=2 cterm=bold gui=bold guifg=darkgreen term=reverse
"  hi def otlTab3 ctermfg=3 cterm=bold gui=bold guifg=brown term=reverse
"  hi def otlTab4 ctermfg=5 cterm=bold gui=bold guifg=darkmagenta term=reverse
"  hi def otlTab5 ctermfg=6 cterm=bold gui=bold guifg=darkcyan term=reverse
"  hi def otlTab6 ctermfg=1 cterm=bold gui=bold guifg=red term=reverse
"  hi def otlTab7 ctermfg=4 cterm=bold gui=bold guifg=blue term=reverse
"  hi def otlTab8 ctermfg=2 cterm=bold gui=bold guifg=darkgreen term=reverse
"  hi def otlTab9 ctermfg=3 cterm=bold gui=bold guifg=brown term=reverse
"else
"  hi def otlTab0 ctermfg=1 cterm=NONE guifg=red
"  hi def otlTab1 ctermfg=4 cterm=NONE guifg=blue
"  hi def otlTab2 ctermfg=2 cterm=NONE guifg=darkgreen
"  hi def otlTab3 ctermfg=3 cterm=NONE guifg=brown
"  hi def otlTab4 ctermfg=5 cterm=NONE guifg=darkmagenta
"  hi def otlTab5 ctermfg=6 cterm=NONE guifg=darkcyan
"  hi def otlTab6 ctermfg=1 cterm=NONE guifg=red
"  hi def otlTab7 ctermfg=4 cterm=NONE guifg=blue
"  hi def otlTab8 ctermfg=2 cterm=NONE guifg=darkgreen
"  hi def otlTab9 ctermfg=3 cterm=NONE guifg=brown
"  hi def otlTodo ctermbg=3 cterm=NONE guibg=lightyellow
"endif



" vim: ts=2 sw=2 et
