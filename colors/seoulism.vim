" seoulism.vim - colorscheme
" A dark theme inspired by traditional East Asian cardinal palettes.
" Focus: Vermilion structural anchors and Jade functional highlights.

hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'seoulism'
set background=dark

let s:palette = {}
let s:palette.bg = '#111116'
let s:palette.bg_faint = '#07070a'
let s:palette.bg_intense = '#1a1a22'

" Primary Spectrum
let s:palette.c0 = '#5f6770' " Charcoal
let s:palette.c1 = '#e05a55' " Vermilion (Primary Structural)
let s:palette.c2 = '#3abf86' " Emerald
let s:palette.c3 = '#e5c15a' " Ochre
let s:palette.c4 = '#3f6bd9' " Royal Blue
let s:palette.c5 = '#e05a55' " Accent Red
let s:palette.c6 = '#3aa39a' " Jade (Functional)
let s:palette.c7 = '#d4d3cf' " Off-white

let s:palette.fg = '#d8d7d2'
let s:palette.fg_faint = '#b7b6b2'
let s:palette.m1 = '#efeeea' " Metal (Structure)"
let s:palette.fg_intense = '#efeeea'

function! s:hi(group, guifg, guibg, ctermfg, ctermbg, attr) abort
  execute 'hi' a:group
        \ 'gui=' . a:attr . ' cterm=' . a:attr
        \ 'guifg=' . a:guifg . ' guibg=' . a:guibg
        \ 'ctermfg=' . a:ctermfg . ' ctermbg=' . a:ctermbg
endfunction

" Functional Anchor: Jade
call s:hi('FuncKey', '#3aa39a', 'NONE', '36', 'NONE', 'bold')

" Diagnostics
if has('nvim')
  try
    execute 'hi DiagnosticUnderlineError gui=undercurl guisp=#e77e79'
    execute 'hi DiagnosticUnderlineWarn  gui=undercurl guisp=#f0d487'
    execute 'hi DiagnosticUnderlineInfo  gui=undercurl guisp=#6f8ee6'
    execute 'hi DiagnosticUnderlineHint  gui=undercurl guisp=#6fd4a8'
  catch
  endtry
endif

" Basic UI
call s:hi('Normal', '#d8d7d2', s:palette.bg, '255', '233', 'NONE')
call s:hi('NormalNC', '#b7b6b2', s:palette.bg, '250', '233', 'NONE')
call s:hi('Comment', '#8f959c', 'NONE', '243', 'NONE', 'italic')
call s:hi('Constant', '#6f8ee6', 'NONE', '69', 'NONE', 'NONE')
call s:hi('String', '#e5c15a', 'NONE', '221', 'NONE', 'NONE')
call s:hi('Character', '#f0d487', 'NONE', '222', 'NONE', 'NONE')
call s:hi('Number', '#e5c15a', 'NONE', '221', 'NONE', 'NONE')
call s:hi('Boolean', '#f0d487', 'NONE', '222', 'NONE', 'NONE')
call s:hi('Float', '#e5c15a', 'NONE', '221', 'NONE', 'NONE')
call s:hi('Identifier', '#d8d7d2', 'NONE', '255', 'NONE', 'NONE')
call s:hi('Function', '#6bc0b6', 'NONE', '73', 'NONE', 'NONE')

" Logic & Control Flow (Vermilion)
call s:hi('Statement', '#e05a55', 'NONE', '167', 'NONE', 'bold')
call s:hi('Conditional', '#e05a55', 'NONE', '167', 'NONE', 'bold')
call s:hi('Repeat', '#e05a55', 'NONE', '167', 'NONE', 'bold')
call s:hi('Keyword', '#e05a55', 'NONE', '167', 'NONE', 'bold')
call s:hi('Label', '#e05a55', 'NONE', '167', 'NONE', 'NONE')
call s:hi('Exception', '#e77e79', 'NONE', '203', 'NONE', 'bold')

" Programming Constructs
call s:hi('Operator', '#d8d7d2', 'NONE', '255', 'NONE', 'NONE')
call s:hi('PreProc', '#6f8ee6', 'NONE', '69', 'NONE', 'NONE')
call s:hi('Include', '#6f8ee6', 'NONE', '69', 'NONE', 'NONE')
call s:hi('Define', '#6f8ee6', 'NONE', '69', 'NONE', 'NONE')
call s:hi('Macro', '#6f8ee6', 'NONE', '69', 'NONE', 'NONE')
call s:hi('PreCondit', '#6f8ee6', 'NONE', '69', 'NONE', 'NONE')
call s:hi('Type', s:palette.m1, 'NONE', '231', 'NONE', 'italic')
call s:hi('StorageClass', s:palette.m1, 'NONE', '231', 'NONE', 'italic')
call s:hi('Structure', s:palette.m1, 'NONE', '231', 'NONE', 'italic')
call s:hi('Typedef', s:palette.m1, 'NONE', '231', 'NONE', 'italic')
call s:hi('Special', '#3aa39a', 'NONE', '36', 'NONE', 'NONE')
call s:hi('Delimiter', '#5f6770', 'NONE', '239', 'NONE', 'NONE')
call s:hi('Error', '#e77e79', s:palette.bg, '203', '233', 'bold')
call s:hi('Todo', s:palette.bg, '#e5c15a', '233', '221', 'bold')

" Editor UI Elements
call s:hi('CursorLine', 'NONE', '#2b2e36', 'NONE', '235', 'NONE')
call s:hi('LineNr', '#5f6770', s:palette.bg, '239', '233', 'NONE')
call s:hi('CursorLineNr', '#f0d487', '#2b2e36', '222', '235', 'bold')
call s:hi('StatusLine', '#d8d7d2', '#2b2e36', '255', '235', 'bold')
call s:hi('StatusLineNC', '#b7b6b2', '#121318', '250', '232', 'NONE')
call s:hi('Pmenu', '#d8d7d2', '#2b2e36', '255', '235', 'NONE')
call s:hi('PmenuSel', '#efeeea', '#2f4fa3', '231', '25', 'bold')
call s:hi('Visual', 'NONE', '#2f4fa3', 'NONE', '25', 'NONE')
call s:hi('Search', s:palette.bg, '#b29245', '233', '137', 'bold')

" Treesitter Integration
silent! hi! link @keyword Keyword
silent! hi! link @conditional Conditional
silent! hi! link @repeat Repeat
silent! hi! link @exception Exception
silent! hi! link @variable Identifier
silent! hi! link @function.builtin Function

if has('nvim')
  let g:terminal_color_0  = s:palette.bg
  let g:terminal_color_1  = '#e05a55'
  let g:terminal_color_2  = '#3abf86'
  let g:terminal_color_3  = '#e5c15a'
  let g:terminal_color_4  = '#3f6bd9'
  let g:terminal_color_5  = '#e05a55'
  let g:terminal_color_6  = '#3aa39a'
  let g:terminal_color_7  = '#d4d3cf'
  let g:terminal_color_8  = '#5f6770'
  let g:terminal_color_9  = '#e77e79'
  " Neovim overrides
  silent! hi! link @keyword.function FuncKey
  silent! hi! link @keyword.method FuncKey
  silent! hi! link @function FuncKey
else
  " Jade Force Paint
  function! s:ForceSeoulismJade() abort
    if exists('w:seoulism_jade_match')
      silent! call matchdelete(w:seoulism_jade_match)
    endif
    let w:seoulism_jade_match = matchadd('FuncKey', '\<func\>\|\<\w\+\>\s\+\zs\w\+\ze\s*(')
  endfunction
endif

augroup SeoulismFinal
  autocmd!
  autocmd BufEnter,WinEnter,Syntax go,c,cpp,rust,python call s:hi('FuncKey', '#3aa39a', 'NONE', '36', 'NONE', 'bold') | call s:ForceSeoulismJade()
augroup END
