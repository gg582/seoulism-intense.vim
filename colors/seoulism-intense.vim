" seoulism-intense.vim - colorscheme
" Systemic light theme based on reversed cardinal color hierarchy.

hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'seoulism-intense'
set background=light

" =============================================================================
" Palette
" =============================================================================
let s:p = {}
let s:p.bg           = '#fdfbf5'
let s:p.bg_sub       = '#f7f2e8'
let s:p.bg_alt       = '#ede4d5'
let s:p.bg_sel       = '#d5ddff'
let s:p.bg_line      = '#f1ebdd'

let s:p.fg           = '#111111'
let s:p.fg_sub       = '#2d2a24'
let s:p.fg_bright    = '#000000'
let s:p.graphite     = '#4c4943'

let s:p.vermilion    = '#b0231b'
let s:p.jade         = '#147a72'
let s:p.emerald      = '#1b9c62'
let s:p.ochre        = '#c0841a'
let s:p.royal_blue   = '#2b4cc2'
let s:p.muted_blue   = '#8a8f9f'
let s:p.charcoal     = '#9a9186'
let s:p.gold         = '#d29d3f'
let s:p.sky          = '#4b68d8'

function! s:hi(group, guifg, guibg, ctermfg, ctermbg, attr) abort
  execute 'hi' a:group
        \ 'gui=' . a:attr . ' cterm=' . a:attr
        \ 'guifg=' . a:guifg . ' guibg=' . a:guibg
        \ 'ctermfg=' . a:ctermfg . ' ctermbg=' . a:ctermbg
endfunction

" =============================================================================
" Core Syntax
" =============================================================================
call s:hi('Normal', s:p.fg, s:p.bg, '16', '231', 'NONE')
call s:hi('NormalNC', s:p.fg_sub, s:p.bg, '235', '231', 'NONE')
call s:hi('Comment', s:p.muted_blue, 'NONE', '103', 'NONE', 'italic')
call s:hi('Constant', s:p.sky, 'NONE', '33', 'NONE', 'NONE')
call s:hi('String', s:p.ochre, 'NONE', '172', 'NONE', 'NONE')
call s:hi('Character', s:p.gold, 'NONE', '178', 'NONE', 'NONE')
call s:hi('Number', s:p.ochre, 'NONE', '172', 'NONE', 'NONE')
call s:hi('Boolean', s:p.gold, 'NONE', '178', 'NONE', 'NONE')
call s:hi('Float', s:p.ochre, 'NONE', '172', 'NONE', 'NONE')
call s:hi('Identifier', s:p.fg_sub, 'NONE', '235', 'NONE', 'NONE')
call s:hi('Function', s:p.jade, 'NONE', '29', 'NONE', 'bold')

call s:hi('Statement', s:p.vermilion, 'NONE', '124', 'NONE', 'bold')
call s:hi('Conditional', s:p.vermilion, 'NONE', '124', 'NONE', 'bold')
call s:hi('Repeat', s:p.vermilion, 'NONE', '124', 'NONE', 'bold')
call s:hi('Keyword', s:p.vermilion, 'NONE', '124', 'NONE', 'bold')
call s:hi('Label', s:p.vermilion, 'NONE', '124', 'NONE', 'NONE')
call s:hi('Exception', '#c93f2f', 'NONE', '160', 'NONE', 'bold')

call s:hi('Operator', s:p.fg_sub, 'NONE', '235', 'NONE', 'NONE')
call s:hi('PreProc', s:p.sky, 'NONE', '33', 'NONE', 'NONE')
call s:hi('Include', s:p.sky, 'NONE', '33', 'NONE', 'NONE')
call s:hi('Define', s:p.sky, 'NONE', '33', 'NONE', 'NONE')
call s:hi('Macro', s:p.sky, 'NONE', '33', 'NONE', 'NONE')
call s:hi('PreCondit', s:p.sky, 'NONE', '33', 'NONE', 'NONE')
call s:hi('Type', s:p.graphite, 'NONE', '238', 'NONE', 'italic')
call s:hi('StorageClass', s:p.graphite, 'NONE', '238', 'NONE', 'italic')
call s:hi('Structure', s:p.graphite, 'NONE', '238', 'NONE', 'italic')
call s:hi('Typedef', s:p.graphite, 'NONE', '238', 'NONE', 'italic')
call s:hi('Special', s:p.jade, 'NONE', '29', 'NONE', 'NONE')
call s:hi('Delimiter', s:p.charcoal, 'NONE', '251', 'NONE', 'NONE')
call s:hi('Underlined', s:p.royal_blue, 'NONE', '33', 'NONE', 'underline')
call s:hi('Ignore', 'NONE', 'NONE', 'NONE', 'NONE', 'NONE')
call s:hi('Error', '#c93f2f', s:p.bg, '160', '231', 'bold')
call s:hi('Todo', s:p.bg, s:p.ochre, '231', '179', 'bold')

" =============================================================================
" Editor UI
" =============================================================================
call s:hi('Cursor', s:p.bg, s:p.fg, '231', '16', 'NONE')
call s:hi('CursorLine', 'NONE', s:p.bg_alt, 'NONE', '188', 'NONE')
call s:hi('LineNr', s:p.charcoal, s:p.bg, '248', '231', 'NONE')
call s:hi('CursorLineNr', s:p.vermilion, s:p.bg_alt, '124', '188', 'bold')
call s:hi('StatusLine', s:p.fg, s:p.bg_alt, '16', '188', 'bold')
call s:hi('StatusLineNC', s:p.fg_sub, s:p.bg_sub, '235', '230', 'NONE')
call s:hi('VertSplit', '#d7cbb9', '#d7cbb9', '187', '187', 'NONE')
call s:hi('Pmenu', s:p.fg, s:p.bg_line, '16', '254', 'NONE')
call s:hi('PmenuSel', s:p.bg, s:p.royal_blue, '231', '26', 'bold')
call s:hi('PmenuSbar', 'NONE', s:p.bg_alt, 'NONE', '188', 'NONE')
call s:hi('PmenuThumb', 'NONE', s:p.charcoal, 'NONE', '248', 'NONE')
call s:hi('Visual', 'NONE', s:p.bg_sel, 'NONE', '153', 'NONE')
call s:hi('Search', s:p.bg, s:p.gold, '231', '179', 'bold')
call s:hi('IncSearch', s:p.bg, s:p.ochre, '231', '172', 'NONE')
call s:hi('NonText', s:p.charcoal, 'NONE', '248', 'NONE', 'NONE')
call s:hi('Folded', s:p.muted_blue, s:p.bg_alt, '103', '188', 'italic')
call s:hi('FoldColumn', s:p.charcoal, s:p.bg, '248', '231', 'NONE')
call s:hi('ColorColumn', 'NONE', s:p.bg_alt, 'NONE', '188', 'NONE')
call s:hi('MatchParen', s:p.fg_bright, '#cfd7f2', '16', '189', 'bold')
call s:hi('Directory', s:p.royal_blue, 'NONE', '33', 'NONE', 'bold')
call s:hi('Title', s:p.vermilion, 'NONE', '124', 'NONE', 'bold')
call s:hi('MoreMsg', s:p.jade, 'NONE', '29', 'NONE', 'bold')
call s:hi('ModeMsg', s:p.jade, 'NONE', '29', 'NONE', 'bold')
call s:hi('Question', s:p.jade, 'NONE', '29', 'NONE', 'bold')
call s:hi('WarningMsg', s:p.ochre, 'NONE', '172', 'NONE', 'bold')
call s:hi('ErrorMsg', s:p.vermilion, s:p.bg, '124', '231', 'bold')

" =============================================================================
" Diagnostics & Diff
" =============================================================================
if has('nvim')
  execute 'hi DiagnosticUnderlineError gui=undercurl guisp=#c93f2f'
  execute 'hi DiagnosticUnderlineWarn  gui=undercurl guisp=#d29d3f'
  execute 'hi DiagnosticUnderlineInfo  gui=undercurl guisp=#4b68d8'
  execute 'hi DiagnosticUnderlineHint  gui=undercurl guisp=#1b9c62'
endif

call s:hi('DiffAdd', s:p.fg, '#dff3e4', '16', '194', 'NONE')
call s:hi('DiffChange', s:p.fg, '#dfe5fb', '16', '189', 'NONE')
call s:hi('DiffDelete', s:p.fg, '#f8d6d4', '16', '217', 'NONE')
call s:hi('DiffText', s:p.fg, '#f5e5c7', '16', '223', 'bold')

" =============================================================================
" Forced Highlighting Logic
" =============================================================================
call s:hi('FuncKey', s:p.jade, 'NONE', '29', 'NONE', 'bold')

function! s:ForceSeoulismTypes() abort
  if exists('w:seoulism_type_matches')
    for l:match_id in w:seoulism_type_matches
      silent! call matchdelete(l:match_id)
    endfor
  endif
  let w:seoulism_type_matches = []
  let l:type_pattern = '\v<[A-Z][a-zA-Z0-9_]+>|<\w+_t>'
  let l:id = matchadd('Type', l:type_pattern, 15)
  call add(w:seoulism_type_matches, l:id)
endfunction

function! s:ForceSeoulismJade() abort
  if exists('w:seoulism_jade_match')
    silent! call matchdelete(w:seoulism_jade_match)
  endif
  let w:seoulism_jade_match = matchadd('FuncKey', '\<func\>\|\<\w\+\>\s\+\zs\w\+\ze\s*(')
endfunction

" =============================================================================
" Integration & Events
" =============================================================================
if has('nvim')
  hi! link @keyword Keyword
  hi! link @conditional Conditional
  hi! link @repeat Repeat
  hi! link @exception Exception
  hi! link @variable Identifier
  hi! link @function.builtin Function
  hi! link @keyword.function FuncKey
  hi! link @keyword.method FuncKey
  hi! link @function FuncKey
  hi! link @lsp.type.type Type
  hi! link @lsp.type.struct Type
  hi! link @lsp.type.enum Type
  hi! link @lsp.type.typedef Type
  hi! link @lsp.type.class Type
endif

augroup Seoulism
  autocmd!
  autocmd FileType c,cpp,go,rust,java,python,typescript call s:ForceSeoulismTypes()
  autocmd BufEnter,WinEnter * if &filetype =~# 'c\|cpp\|go\|rust\|java\|python\|typescript' | call s:ForceSeoulismTypes() | endif
  autocmd BufEnter,WinEnter,Syntax go,c,cpp,rust,python call s:hi('FuncKey', s:p.jade, 'NONE', '29', 'NONE', 'bold') | call s:ForceSeoulismJade()
augroup END

" Terminal colors
if has('nvim')
  let g:terminal_color_0 = s:p.bg
  let g:terminal_color_1 = s:p.vermilion
  let g:terminal_color_2 = s:p.emerald
  let g:terminal_color_3 = s:p.ochre
  let g:terminal_color_4 = s:p.royal_blue
  let g:terminal_color_5 = '#c93f2f'
  let g:terminal_color_6 = s:p.jade
  let g:terminal_color_7 = s:p.fg
  let g:terminal_color_8 = s:p.charcoal
  let g:terminal_color_9 = '#c93f2f'
endif

call s:ForceSeoulismTypes()

" =============================================================================
" Semantic & Language Server Protocol Groups
" =============================================================================
call s:hi('LspVariable', s:p.fg_sub, 'NONE', '235', 'NONE', 'NONE')
call s:hi('LspParameter', s:p.jade, 'NONE', '29', 'NONE', 'italic')
call s:hi('LspKeyword', s:p.vermilion, 'NONE', '124', 'NONE', 'bold')
call s:hi('LspControlFlow', s:p.vermilion, 'NONE', '124', 'NONE', 'bold')
call s:hi('LspStaticVariable', s:p.ochre, 'NONE', '172', 'NONE', 'bold')
call s:hi('LspEnumMember', s:p.ochre, 'NONE', '172', 'NONE', 'NONE')
call s:hi('LspInterface', s:p.graphite, 'NONE', '238', 'NONE', 'bold')
call s:hi('LspStruct', s:p.graphite, 'NONE', '238', 'NONE', 'italic')
call s:hi('LspErrorText', s:p.vermilion, 'NONE', '160', 'NONE', 'underline')
call s:hi('LspWarningText', s:p.gold, 'NONE', '178', 'NONE', 'underline')
highlight vimVar guifg=#2d2a24 gui=italic
highlight vimFBVar guifg=#2d2a24 gui=italic
highlight vimAmbiguousVimVar guifg=#2d2a24 gui=italic
