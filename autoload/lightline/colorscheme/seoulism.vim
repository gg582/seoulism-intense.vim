" seoulism lightline colorscheme
" File: autoload/lightline/colorscheme/seoulism.vim

if exists('g:lightline#colorscheme#seoulism#palette')
  finish
endif

let s:palette = {}

" Base colors (GUI + cterm)
let s:bg         = ['#181a1f', 233]
let s:bg_faint   = ['#121318', 232]
let s:bg_intense = ['#2b2e36', 235]

let s:fg         = ['#d8d7d2', 255]
let s:fg_faint   = ['#b7b6b2', 250]
let s:fg_intense = ['#efeeea', 231]

" Accents from seoulism
let s:red        = ['#e05a55', 203]
let s:red_soft   = ['#e77e79', 210]
let s:yellow     = ['#e5c15a', 221]
let s:blue       = ['#3f6bd9',  26]
let s:jade       = ['#3aa39a',  36]

" Helper to create a segment
function! s:seg(fg, bg, attr) abort
  " Return format: [ guifg, guibg, ctermfg, ctermbg, attr ]
  return [a:fg[0], a:bg[0], a:fg[1], a:bg[1], a:attr]
endfunction

let s:p = {
\ 'normal':   {},
\ 'insert':   {},
\ 'visual':   {},
\ 'replace':  {},
\ 'inactive': {},
\ 'tabline':  {},
\ }

" NORMAL:
" Pull red aggressively: mode block + far-right block use red backgrounds.
" Keep text readable: use dark text on red.
let s:p.normal.left   = [ s:seg(s:bg, s:red, 'bold'), s:seg(s:fg, s:bg_intense, 'NONE') ]
let s:p.normal.middle = [ s:seg(s:fg_faint, s:bg, 'NONE') ]
let s:p.normal.right  = [ s:seg(s:fg, s:bg_intense, 'NONE'), s:seg(s:bg, s:red, 'bold') ]
let s:p.normal.error  = [ s:seg(s:bg, s:red_soft, 'bold') ]
let s:p.normal.warning= [ s:seg(s:bg, s:yellow, 'bold') ]

" INSERT:
" Still keep insert distinct (jade), but keep a red block on the far-right for consistency.
let s:p.insert.left   = [ s:seg(s:bg, s:jade, 'bold'), s:seg(s:fg, s:bg_intense, 'NONE') ]
let s:p.insert.middle = [ s:seg(s:fg_faint, s:bg, 'NONE') ]
let s:p.insert.right  = [ s:seg(s:fg, s:bg_intense, 'NONE'), s:seg(s:bg, s:red, 'bold') ]
let s:p.insert.error  = s:p.normal.error
let s:p.insert.warning= s:p.normal.warning

" VISUAL:
" Blue mode block, but keep red far-right.
let s:p.visual.left   = [ s:seg(s:bg, s:blue, 'bold'), s:seg(s:fg, s:bg_intense, 'NONE') ]
let s:p.visual.middle = [ s:seg(s:fg_faint, s:bg, 'NONE') ]
let s:p.visual.right  = [ s:seg(s:fg, s:bg_intense, 'NONE'), s:seg(s:bg, s:red, 'bold') ]
let s:p.visual.error  = s:p.normal.error
let s:p.visual.warning= s:p.normal.warning

" REPLACE:
" Strong red on both ends.
let s:p.replace.left   = [ s:seg(s:bg, s:red, 'bold'), s:seg(s:fg, s:bg_intense, 'NONE') ]
let s:p.replace.middle = [ s:seg(s:fg_faint, s:bg, 'NONE') ]
let s:p.replace.right  = [ s:seg(s:fg, s:bg_intense, 'NONE'), s:seg(s:bg, s:red, 'bold') ]
let s:p.replace.error  = s:p.normal.error
let s:p.replace.warning= s:p.normal.warning

" INACTIVE:
let s:p.inactive.left   = [ s:seg(s:fg_faint, s:bg_faint, 'NONE'), s:seg(s:fg_faint, s:bg_faint, 'NONE') ]
let s:p.inactive.middle = [ s:seg(s:fg_faint, s:bg_faint, 'NONE') ]
let s:p.inactive.right  = [ s:seg(s:fg_faint, s:bg_faint, 'NONE'), s:seg(s:fg_faint, s:bg_faint, 'NONE') ]

" TABLINE:
let s:p.tabline.left   = [ s:seg(s:fg_faint, s:bg_faint, 'NONE') ]
let s:p.tabline.tabsel = [ s:seg(s:fg_intense, s:bg_intense, 'bold') ]
let s:p.tabline.middle = [ s:seg(s:fg_faint, s:bg_faint, 'NONE') ]
let s:p.tabline.right  = [ s:seg(s:fg_faint, s:bg_faint, 'NONE') ]
let s:p.tabline.fill   = [ s:seg(s:fg_faint, s:bg_faint, 'NONE') ]

let g:lightline#colorscheme#seoulism#palette = lightline#colorscheme#flatten(s:p)

