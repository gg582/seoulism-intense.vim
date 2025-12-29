" seoulism.vim - colorscheme
" Seoulism palette: Obangsaek anchors + cheongrok turquoise
" Mapping note: red reserved for true errors; structure keywords use calm purple to reduce visual noise.

hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'seoulism'
set background=dark

let s:palette = {}
let s:palette.bg = '#181a1f'
let s:palette.bg_faint = '#121318'
let s:palette.bg_intense = '#2b2e36'
let s:palette.c0 = '#5f6770'
let s:palette.c0_f = '#4f555d'
let s:palette.c0_i = '#8f959c'
let s:palette.c1 = '#e05a55'
let s:palette.c1_f = '#b24a45'
let s:palette.c1_i = '#e77e79'
let s:palette.c2 = '#3abf86'
let s:palette.c2_f = '#2a8f65'
let s:palette.c2_i = '#6fd4a8'
let s:palette.c3 = '#e5c15a'
let s:palette.c3_f = '#b29245'
let s:palette.c3_i = '#f0d487'
let s:palette.c4 = '#3f6bd9'
let s:palette.c4_f = '#2f4fa3'
let s:palette.c4_i = '#6f8ee6'
let s:palette.c5 = '#9a6fd6'
let s:palette.c5_f = '#7d55aa'
let s:palette.c5_i = '#b58be3'
let s:palette.c6 = '#3aa39a'
let s:palette.c6_f = '#2a756f'
let s:palette.c6_i = '#6bc0b6'
let s:palette.c7 = '#d4d3cf'
let s:palette.c7_f = '#a9a8a4'
let s:palette.c7_i = '#e2e1dd'
let s:palette.fg = '#d8d7d2'
let s:palette.fg_faint = '#b7b6b2'
let s:palette.fg_intense = '#efeeea'

function! s:hi(group, guifg, guibg, ctermfg, ctermbg, attr) abort
  execute 'hi' a:group
        \ 'gui=' . a:attr . ' cterm=' . a:attr
        \ 'guifg=' . a:guifg . ' guibg=' . a:guibg
        \ 'ctermfg=' . a:ctermfg . ' ctermbg=' . a:ctermbg
endfunction

" --- Fundamental Definition: Birth (Jade) ---
" Define this early so other groups can link to it.
call s:hi('FuncKey', '#3aa39a', 'NONE', '36', 'NONE', 'bold')

" Undercurl colors (best-effort):
if has('nvim')
  try
    execute 'hi DiagnosticUnderlineError gui=undercurl guisp=#e77e79'
    execute 'hi DiagnosticUnderlineWarn  gui=undercurl guisp=#f0d487'
    execute 'hi DiagnosticUnderlineInfo  gui=undercurl guisp=#6f8ee6'
    execute 'hi DiagnosticUnderlineHint  gui=undercurl guisp=#6fd4a8'
  catch
  endtry
endif

call s:hi('Normal', '#d8d7d2', '#181a1f', '255', '233', 'NONE')
call s:hi('NormalNC', '#b7b6b2', '#181a1f', '250', '233', 'NONE')
call s:hi('Comment', '#8f959c', 'NONE', '243', 'NONE', 'italic')
call s:hi('Constant', '#6f8ee6', 'NONE', '69', 'NONE', 'NONE')
call s:hi('String', '#e5c15a', 'NONE', '221', 'NONE', 'NONE')
call s:hi('Character', '#f0d487', 'NONE', '222', 'NONE', 'NONE')
call s:hi('Number', '#e5c15a', 'NONE', '221', 'NONE', 'NONE')
call s:hi('Boolean', '#f0d487', 'NONE', '222', 'NONE', 'NONE')
call s:hi('Float', '#e5c15a', 'NONE', '221', 'NONE', 'NONE')
call s:hi('Identifier', '#d8d7d2', 'NONE', '255', 'NONE', 'NONE')
call s:hi('Function', '#6bc0b6', 'NONE', '73', 'NONE', 'NONE')
call s:hi('Statement', '#7d55aa', 'NONE', '97', 'NONE', 'NONE')
call s:hi('Conditional', '#7d55aa', 'NONE', '97', 'NONE', 'NONE')
call s:hi('Repeat', '#7d55aa', 'NONE', '97', 'NONE', 'NONE')
call s:hi('Label', '#9a6fd6', 'NONE', '134', 'NONE', 'NONE')
call s:hi('Operator', '#d8d7d2', 'NONE', '255', 'NONE', 'NONE')
call s:hi('Keyword', '#7d55aa', 'NONE', '97', 'NONE', 'NONE')
call s:hi('Exception', '#9a6fd6', 'NONE', '134', 'NONE', 'NONE')
call s:hi('PreProc', '#6f8ee6', 'NONE', '69', 'NONE', 'NONE')
call s:hi('Include', '#6f8ee6', 'NONE', '69', 'NONE', 'NONE')
call s:hi('Define', '#6f8ee6', 'NONE', '69', 'NONE', 'NONE')
call s:hi('Macro', '#6f8ee6', 'NONE', '69', 'NONE', 'NONE')
call s:hi('PreCondit', '#6f8ee6', 'NONE', '69', 'NONE', 'NONE')
call s:hi('Type', '#3f6bd9', 'NONE', '26', 'NONE', 'NONE')
call s:hi('StorageClass', '#3f6bd9', 'NONE', '26', 'NONE', 'NONE')
call s:hi('Structure', '#3f6bd9', 'NONE', '26', 'NONE', 'NONE')
call s:hi('Typedef', '#3f6bd9', 'NONE', '26', 'NONE', 'NONE')
call s:hi('Special', '#3aa39a', 'NONE', '36', 'NONE', 'NONE')
call s:hi('SpecialChar', '#f0d487', 'NONE', '222', 'NONE', 'NONE')
call s:hi('Tag', '#6f8ee6', 'NONE', '69', 'NONE', 'NONE')
call s:hi('Delimiter', '#5f6770', 'NONE', '239', 'NONE', 'NONE')
call s:hi('SpecialComment', '#8f959c', 'NONE', '243', 'NONE', 'italic')
call s:hi('Debug', '#b58be3', 'NONE', '177', 'NONE', 'NONE')
call s:hi('Underlined', '#6f8ee6', 'NONE', '69', 'NONE', 'underline')
call s:hi('Ignore', '#5f6770', 'NONE', '239', 'NONE', 'NONE')
call s:hi('Error', '#e77e79', '#181a1f', '203', '233', 'bold')
call s:hi('Todo', '#181a1f', '#e5c15a', '233', '221', 'bold')
call s:hi('CursorLine', 'NONE', '#2b2e36', 'NONE', '235', 'NONE')
call s:hi('CursorColumn', 'NONE', '#2b2e36', 'NONE', '235', 'NONE')
call s:hi('ColorColumn', 'NONE', '#2b2e36', 'NONE', '235', 'NONE')
call s:hi('LineNr', '#5f6770', '#181a1f', '239', '233', 'NONE')
call s:hi('CursorLineNr', '#f0d487', '#2b2e36', '222', '235', 'bold')
call s:hi('SignColumn', '#5f6770', '#181a1f', '239', '233', 'NONE')
call s:hi('FoldColumn', '#5f6770', '#181a1f', '239', '233', 'NONE')
call s:hi('Folded', '#8f959c', '#2b2e36', '243', '235', 'NONE')
call s:hi('VertSplit', '#2b2e36', '#181a1f', '235', '233', 'NONE')
call s:hi('WinSeparator', '#2b2e36', '#181a1f', '235', '233', 'NONE')
call s:hi('StatusLine', '#d8d7d2', '#2b2e36', '255', '235', 'bold')
call s:hi('StatusLineNC', '#b7b6b2', '#121318', '250', '232', 'NONE')
call s:hi('TabLine', '#b7b6b2', '#121318', '250', '232', 'NONE')
call s:hi('TabLineSel', '#efeeea', '#2b2e36', '231', '235', 'bold')
call s:hi('TabLineFill', '#b7b6b2', '#121318', '250', '232', 'NONE')
call s:hi('Pmenu', '#d8d7d2', '#2b2e36', '255', '235', 'NONE')
call s:hi('PmenuSel', '#efeeea', '#2f4fa3', '231', '25', 'bold')
call s:hi('PmenuSbar', 'NONE', '#2b2e36', 'NONE', '235', 'NONE')
call s:hi('PmenuThumb', 'NONE', '#5f6770', 'NONE', '239', 'NONE')
call s:hi('Visual', 'NONE', '#2f4fa3', 'NONE', '25', 'NONE')
call s:hi('Search', '#181a1f', '#b29245', '233', '137', 'bold')
call s:hi('IncSearch', '#181a1f', '#9a6fd6', '233', '134', 'bold')
call s:hi('MatchParen', '#efeeea', '#2b2e36', '231', '235', 'bold')
call s:hi('Directory', '#6f8ee6', 'NONE', '69', 'NONE', 'NONE')
call s:hi('Title', '#e2e1dd', 'NONE', '254', 'NONE', 'bold')
call s:hi('NonText', '#2b2e36', '#181a1f', '235', '233', 'NONE')
call s:hi('Whitespace', '#2b2e36', '#181a1f', '235', '233', 'NONE')
call s:hi('SpecialKey', '#2b2e36', '#181a1f', '235', '233', 'NONE')
call s:hi('EndOfBuffer', '#181a1f', '#181a1f', '233', '233', 'NONE')
call s:hi('ErrorMsg', '#e77e79', '#181a1f', '203', '233', 'bold')
call s:hi('WarningMsg', '#f0d487', '#181a1f', '222', '233', 'bold')
call s:hi('MoreMsg', '#6fd4a8', 'NONE', '79', 'NONE', 'bold')
call s:hi('ModeMsg', '#e2e1dd', 'NONE', '254', 'NONE', 'bold')
call s:hi('Question', '#e5c15a', 'NONE', '221', 'NONE', 'bold')
call s:hi('QuickFixLine', '#181a1f', '#2a756f', '233', '29', 'bold')
call s:hi('DiffAdd', '#d8d7d2', '#2f4fa3', '255', '25', 'NONE')
call s:hi('DiffChange', '#d8d7d2', '#3f6bd9', '255', '26', 'NONE')
call s:hi('DiffDelete', '#d8d7d2', '#b24a45', '255', '131', 'NONE')
call s:hi('DiffText', '#181a1f', '#6f8ee6', '233', '69', 'bold')
call s:hi('SpellBad', 'NONE', 'NONE', 'NONE', 'NONE', 'undercurl')
call s:hi('SpellCap', 'NONE', 'NONE', 'NONE', 'NONE', 'undercurl')
call s:hi('SpellLocal', 'NONE', 'NONE', 'NONE', 'NONE', 'undercurl')
call s:hi('SpellRare', 'NONE', 'NONE', 'NONE', 'NONE', 'undercurl')
call s:hi('DiagnosticError', '#e77e79', 'NONE', '203', 'NONE', 'NONE')
call s:hi('DiagnosticWarn', '#f0d487', 'NONE', '222', 'NONE', 'NONE')
call s:hi('DiagnosticInfo', '#6f8ee6', 'NONE', '69', 'NONE', 'NONE')
call s:hi('DiagnosticHint', '#6fd4a8', 'NONE', '79', 'NONE', 'NONE')
call s:hi('DiagnosticOk', '#e5c15a', 'NONE', '221', 'NONE', 'NONE')
call s:hi('DiagnosticUnderlineError', 'NONE', 'NONE', 'NONE', 'NONE', 'undercurl')
call s:hi('DiagnosticUnderlineWarn', 'NONE', 'NONE', 'NONE', 'NONE', 'undercurl')
call s:hi('DiagnosticUnderlineInfo', 'NONE', 'NONE', 'NONE', 'NONE', 'undercurl')
call s:hi('DiagnosticUnderlineHint', 'NONE', 'NONE', 'NONE', 'NONE', 'undercurl')

" --- Systemic Override (Birth Anchor) ---
" Placing legacy links before Treesitter to set the baseline
hi! link StorageClass FuncKey
hi! link Structure FuncKey
hi! link Function FuncKey

" Treesitter links:
silent! hi! link @comment Comment
silent! hi! link @string String
silent! hi! link @string.escape SpecialChar
silent! hi! link @character Character
silent! hi! link @number Number
silent! hi! link @boolean Boolean
silent! hi! link @float Float
silent! hi! link @constant Constant
silent! hi! link @constant.builtin Constant
silent! hi! link @function Function
silent! hi! link @function.builtin Function
silent! hi! link @keyword Keyword
" REPEAT: Do NOT link @keyword.function to Keyword here to avoid purple override.
silent! hi! link @keyword.return Keyword
silent! hi! link @conditional Conditional
silent! hi! link @repeat Repeat
silent! hi! link @operator Operator
silent! hi! link @type Type
silent! hi! link @type.builtin Type
silent! hi! link @punctuation.delimiter Delimiter
silent! hi! link @punctuation.bracket Delimiter
silent! hi! link @variable Identifier
silent! hi! link @variable.builtin Identifier
silent! hi! link @property Identifier
silent! hi! link @field Identifier
silent! hi! link @parameter Identifier
silent! hi! link @tag Tag
silent! hi! link @tag.attribute Identifier
silent! hi! link @namespace Include
silent! hi! link @include Include
silent! hi! link @preproc PreProc
silent! hi! link @exception Exception
silent! hi! link @text.todo Todo

" Legacy links:
hi! link SpecialKey NonText
hi! link EndOfBuffer NonText
hi! link CursorLineSign SignColumn
hi! link CursorLineFold FoldColumn

" Neovim terminal palette:
if has('nvim')
  let g:terminal_color_0  = '#181a1f'
  let g:terminal_color_1  = '#9a6fd6'
  let g:terminal_color_2  = '#3abf86'
  let g:terminal_color_3  = '#e5c15a'
  let g:terminal_color_4  = '#3f6bd9'
  let g:terminal_color_5  = '#e05a55'
  let g:terminal_color_6  = '#3aa39a'
  let g:terminal_color_7  = '#d4d3cf'
  let g:terminal_color_8  = '#5f6770'
  let g:terminal_color_9  = '#b58be3'
  let g:terminal_color_10 = '#6fd4a8'
  let g:terminal_color_11 = '#f0d487'
  let g:terminal_color_12 = '#6f8ee6'
  let g:terminal_color_13 = '#e77e79'
  let g:terminal_color_14 = '#6bc0b6'
  let g:terminal_color_15 = '#efeeea'
  " Neovim specific overrides
  silent! hi! link @keyword.function FuncKey
  silent! hi! link @keyword.method FuncKey
  silent! hi! link @function FuncKey
endif

" --- THE UNSTOPPABLE JADE FORCE (Vim 9.1 Absolute Override) ---
" This uses 'matchadd' which lives in a higher layer than the syntax engine.
function! s:ForceSeoulismJade() abort
  " Clear existing matches to prevent memory leaks
  if exists('w:seoulism_jade_match')
    silent! call matchdelete(w:seoulism_jade_match)
  endif
  " Force 'func' and 'function name' into Jade(c6)
  " This bypasses the entire syntax engine and paints directly on the screen.
  let w:seoulism_jade_match = matchadd('FuncKey', '\<func\>\|\%(\<void\>\|\<int\>\|\<char\>\)\s\+\zs\w\+\ze\s*(')
endfunction

augroup SeoulismFinalVictory
  autocmd!
  " Trigger the force-paint every time a buffer is entered or syntax is loaded
  autocmd BufEnter,WinEnter,Syntax go,c,cpp,rust,python call s:hi('FuncKey', '#3aa39a', 'NONE', '36', 'NONE', 'bold') | call s:hi('Function', '#6bc0b6', 'NONE', '73', 'NONE', 'NONE') | call s:ForceSeoulismJade()
augroup END
