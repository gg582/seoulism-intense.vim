" autoload/lightline/colorscheme/seoulism_intense.vim
scriptencoding utf-8

let s:ink        = ['#302e29', 236]
let s:ink_soft   = ['#4a463f', 238]
let s:paper      = ['#f4efe6', 255]
let s:paper_mid  = ['#f1ebdd', 254]
let s:paper_alt  = ['#ede4d5', 223]
let s:paper_deep = ['#e4d6c4', 187]
let s:cursor_blue = ['#add8e6', 153]

let s:red        = ['#dea8a0', 181]
let s:blue       = ['#aebde2', 146]
let s:jade       = ['#9ac9c3', 116]
let s:honey      = ['#d7b88f', 180]
let s:graphite   = ['#9a9186', 250]

function! s:seg(fg, bg, ...) abort
  let l:attr = a:0 ? a:1 : 'NONE'
  return [a:fg[0], a:bg[0], a:fg[1], a:bg[1], l:attr]
endfunction

let s:p = {}

" --- Normal Mode ---
let s:p.normal = {}
let s:p.normal.left = [
      \ s:seg(s:ink, s:honey, 'bold'),
      \ s:seg(s:ink, s:paper_mid),
      \ ]
let s:p.normal.middle = [ s:seg(s:ink_soft, s:paper) ]
let s:p.normal.right = [
      \ s:seg(s:ink, s:honey, 'bold'),
      \ s:seg(s:ink, s:paper_mid),
      \ s:seg(s:ink_soft, s:paper),
      \ ]
let s:p.normal.error = [ s:seg(s:ink, s:red, 'bold') ]
let s:p.normal.warning = [ s:seg(s:ink, s:paper_alt) ]
let s:p.normal.special = [ s:seg(s:ink, s:paper_mid, 'bold') ]

" --- Insert Mode ---
let s:p.insert = {}
let s:p.insert.left = [
      \ s:seg(s:ink, s:cursor_blue, 'bold'),
      \ s:seg(s:ink, s:paper_mid),
      \ ]
let s:p.insert.middle = s:p.normal.middle
let s:p.insert.right = [
      \ s:seg(s:ink, s:cursor_blue, 'bold'),
      \ s:seg(s:ink, s:paper_mid),
      \ s:seg(s:ink_soft, s:paper),
      \ ]

" --- Visual Mode ---
let s:p.visual = {}
let s:p.visual.left = [
      \ s:seg(s:ink, s:blue, 'bold'),
      \ s:seg(s:ink, s:paper_mid),
      \ ]
let s:p.visual.middle = s:p.normal.middle
let s:p.visual.right = [
      \ s:seg(s:ink, s:blue, 'bold'),
      \ s:seg(s:ink, s:paper_mid),
      \ s:seg(s:ink_soft, s:paper),
      \ ]

" --- Replace Mode ---
let s:p.replace = {}
let s:p.replace.left = [
      \ s:seg(s:ink, s:red, 'bold'),
      \ s:seg(s:ink, s:paper_mid),
      \ ]
let s:p.replace.middle = s:p.normal.middle
let s:p.replace.right = [
      \ s:seg(s:ink, s:red, 'bold'),
      \ s:seg(s:ink, s:paper_mid),
      \ s:seg(s:ink_soft, s:paper),
      \ ]

" --- Command Mode ---
let s:p.command = {}
let s:p.command.left = [
      \ s:seg(s:ink, s:paper_mid, 'bold'),
      \ s:seg(s:ink, s:paper_deep),
      \ ]
let s:p.command.middle = s:p.normal.middle
let s:p.command.right = [
      \ s:seg(s:ink, s:paper_mid, 'bold'),
      \ s:seg(s:ink, s:paper_deep),
      \ s:seg(s:ink_soft, s:paper),
      \ ]

" --- Inactive ---
let s:p.inactive = {}
let s:p.inactive.left = [ s:seg(s:ink_soft, s:paper), s:seg(s:ink_soft, s:paper) ]
let s:p.inactive.middle = [ s:seg(s:ink_soft, s:paper) ]
let s:p.inactive.right = [ s:seg(s:ink_soft, s:paper), s:seg(s:ink_soft, s:paper) ]

" --- Tabline ---
let s:p.tabline = {}
let s:p.tabline.left = [ s:seg(s:ink_soft, s:paper_mid) ]
let s:p.tabline.middle = [ s:seg(s:ink_soft, s:paper) ]
let s:p.tabline.right = [ s:seg(s:ink_soft, s:paper_mid) ]
let s:p.tabline.tabsel = [ s:seg(s:ink, s:jade, 'bold') ]

" Command area keeps the paper glow
highlight CommandModeMsg guifg=#302e29 guibg=#f4efe6 gui=bold
highlight ModeMsg guifg=#302e29 gui=bold

augroup SeoulismCommandLogic
  autocmd!
  autocmd CmdLineEnter * highlight StatusLine guifg=#302e29 guibg=#f4efe6 gui=bold
  autocmd CmdLineLeave * highlight StatusLine guifg=#302e29 guibg=#ede4d5 gui=bold
augroup END

highlight SpecialKey guifg=#968d83
highlight NonText guifg=#968d83

let g:lightline#colorscheme#seoulism_intense#palette = lightline#colorscheme#fill(s:p)
