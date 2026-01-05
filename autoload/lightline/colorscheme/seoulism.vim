" autoload/lightline/colorscheme/seoulism.vim
scriptencoding utf-8

" Color palette definition: [gui, cterm]
let s:bg       = ['#181a1f', 233]
let s:bg_faint = ['#121318', 232]
let s:bg_int   = ['#2b2e36', 235]

let s:fg       = ['#d8d7d2', 255]
let s:fg_faint = ['#b7b6b2', 250]
let s:fg_i     = ['#efeeea', 231]

let s:red      = ['#e05a55', 203]
let s:red_dim  = ['#b24a45', 131]

let s:blue     = ['#3f6bd9', 26]
let s:jade     = ['#3aa39a', 36]
let s:green    = ['#3abf86', 35]
let s:yellow   = ['#e5c15a', 221]
let s:gray     = ['#5f6770', 239]

" Helper function to generate segment
function! s:seg(fg, bg, ...) abort
  let l:attr = a:0 ? a:1 : 'NONE'
  return [a:fg[0], a:bg[0], a:fg[1], a:bg[1], l:attr]
endfunction

let s:p = {}

" --- Normal Mode ---
let s:p.normal = {}
let s:p.normal.left = [
      \ s:seg(s:bg, s:red_dim, 'bold'),
      \ s:seg(s:fg, s:bg_int),
      \ ]
let s:p.normal.middle = [ s:seg(s:fg_faint, s:bg_faint) ]
let s:p.normal.right = [
      \ s:seg(s:bg, s:red, 'bold'),
      \ s:seg(s:fg, s:bg_int),
      \ s:seg(s:fg_faint, s:bg_faint),
      \ ]

" --- Insert Mode ---
let s:p.insert = {}
let s:p.insert.left = [ s:seg(s:bg, s:green, 'bold'), s:seg(s:fg, s:bg_int) ]
let s:p.insert.middle = s:p.normal.middle
let s:p.insert.right = s:p.normal.right

" --- Visual Mode ---
let s:p.visual = {}
let s:p.visual.left = [ s:seg(s:bg, s:red_dim, 'bold'), s:seg(s:fg, s:bg_int) ]
let s:p.visual.middle = s:p.normal.middle
let s:p.visual.right = s:p.normal.right

" --- Replace Mode ---
let s:p.replace = {}
let s:p.replace.left = [ s:seg(s:bg, s:red, 'bold'), s:seg(s:fg, s:bg_int) ]
let s:p.replace.middle = s:p.normal.middle
let s:p.replace.right = s:p.normal.right

" --- Inactive ---
let s:p.inactive = {}
let s:p.inactive.left = [ s:seg(s:fg_faint, s:bg_faint), s:seg(s:fg_faint, s:bg_faint) ]
let s:p.inactive.middle = [ s:seg(s:fg_faint, s:bg_faint) ]
let s:p.inactive.right = [ s:seg(s:fg_faint, s:bg_faint), s:seg(s:fg_faint, s:bg_faint) ]

" --- Tabline ---
let s:p.tabline = {}
let s:p.tabline.left = [ s:seg(s:fg_faint, s:bg_faint) ]
let s:p.tabline.middle = [ s:seg(s:fg_faint, s:bg_faint) ]
let s:p.tabline.right = [ s:seg(s:fg_faint, s:bg_faint) ]
let s:p.tabline.tabsel = [ s:seg(s:fg_i, s:bg_int, 'bold') ]

" Register the palette
let g:lightline#colorscheme#seoulism#palette = lightline#colorscheme#fill(s:p)
