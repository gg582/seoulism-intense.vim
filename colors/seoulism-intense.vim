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
" Counter-order: Wood→Metal → Fire→Water → Earth→Wood → Metal→Fire → Water→Earth
let s:p = {}
" Ergonomic revision: every accent keeps its original OKLCH hue, but chroma is
" lowered (~0.4-0.7x) and lightness is equalized so syntax sits at WCAG ~5:1
" on the field (comments ~4:1, gutter ~2.7:1). Low-contrast-but-saturated
" pairs (the main source of glare/vibration) are removed.
let s:p.metal_field  = '#e9e6df'
let s:p.metal_edge   = '#f1ebdd'
let s:p.metal_mute   = '#ded3d4'
let s:p.bg           = s:p.metal_field
let s:p.bg_sub       = '#f4efe6'
let s:p.bg_alt       = s:p.metal_mute
let s:p.bg_sel       = '#cad0e9'
let s:p.bg_line      = s:p.metal_edge

let s:p.water_ink    = '#302e29'
let s:p.water_graphite = '#524f4a'
let s:p.fg           = s:p.water_ink
let s:p.fg_sub       = '#423f3a'
let s:p.fg_bright    = '#1e1c19'
let s:p.graphite     = s:p.water_graphite

let s:p.fire_alarm   = '#94473d'
let s:p.fire_busy    = '#ad433d'
let s:p.wood_jade    = '#366964'
let s:p.wood_link    = '#445c99'
let s:p.emerald      = '#386d4f'
let s:p.earth_literal = '#7f5c39'
let s:p.earth_gold   = '#715e36'
let s:p.earth_comment = '#7e6f54'
let s:p.earth_delim  = '#77694c'
let s:p.earth_gutter = '#978a73'
let s:p.earth_dust   = '#ada38f'
let s:p.muted_blue   = '#496283'
let s:p.charcoal     = '#968d83'
let s:p.signal_blue  = '#4e619b'
let s:p.cursor_blue  = '#add8e6'
let s:p.split        = '#d2c9bd'

" Soft tints (same hues) for filled highlights instead of solid saturated blocks
let s:p.tint_search  = '#b7c7ec'
let s:p.tint_inc     = '#a3d2cc'
let s:p.tint_pmsel   = '#acbde5'
let s:p.tint_todo    = '#c0ceec'

function! s:hi(group, guifg, guibg, ctermfg, ctermbg, attr) abort
  execute 'hi' a:group
        \ 'gui=' . a:attr . ' cterm=' . a:attr
        \ 'guifg=' . a:guifg . ' guibg=' . a:guibg
        \ 'ctermfg=' . a:ctermfg . ' ctermbg=' . a:ctermbg
endfunction

" =============================================================================
" Core Syntax
" =============================================================================
call s:hi('Normal', s:p.fg, s:p.bg, '236', '254', 'NONE')
call s:hi('NormalNC', s:p.fg_sub, s:p.bg, '238', '254', 'NONE')
call s:hi('Comment', s:p.earth_comment, 'NONE', '101', 'NONE', 'italic')
call s:hi('Constant', s:p.signal_blue, 'NONE', '61', 'NONE', 'NONE')
call s:hi('String', s:p.wood_link, 'NONE', '60', 'NONE', 'NONE')
call s:hi('Character', s:p.wood_jade, 'NONE', '23', 'NONE', 'NONE')
call s:hi('Number', s:p.emerald, 'NONE', '29', 'NONE', 'NONE')
call s:hi('Boolean', s:p.wood_jade, 'NONE', '23', 'NONE', 'NONE')
call s:hi('Float', s:p.emerald, 'NONE', '29', 'NONE', 'NONE')
call s:hi('Identifier', s:p.fg, 'NONE', '236', 'NONE', 'NONE')
call s:hi('Function', s:p.muted_blue, 'NONE', '24', 'NONE', 'bold')

call s:hi('Statement', s:p.graphite, 'NONE', '239', 'NONE', 'bold')
call s:hi('Conditional', s:p.graphite, 'NONE', '239', 'NONE', 'bold')
call s:hi('Repeat', s:p.graphite, 'NONE', '239', 'NONE', 'bold')
call s:hi('Keyword', s:p.graphite, 'NONE', '239', 'NONE', 'bold')
call s:hi('Label', s:p.graphite, 'NONE', '239', 'NONE', 'NONE')
call s:hi('Exception', s:p.graphite, 'NONE', '239', 'NONE', 'bold')

call s:hi('Operator', s:p.graphite, 'NONE', '239', 'NONE', 'NONE')
call s:hi('PreProc', s:p.wood_jade, 'NONE', '23', 'NONE', 'NONE')
call s:hi('Include', s:p.wood_jade, 'NONE', '23', 'NONE', 'NONE')
call s:hi('Define', s:p.wood_jade, 'NONE', '23', 'NONE', 'NONE')
call s:hi('Macro', s:p.wood_jade, 'NONE', '23', 'NONE', 'NONE')
call s:hi('PreCondit', s:p.wood_jade, 'NONE', '23', 'NONE', 'NONE')
call s:hi('Type', s:p.fire_alarm, 'NONE', '95', 'NONE', 'italic')
call s:hi('StorageClass', s:p.fire_alarm, 'NONE', '95', 'NONE', 'italic')
call s:hi('Structure', s:p.fire_alarm, 'NONE', '95', 'NONE', 'italic')
call s:hi('Typedef', s:p.fire_alarm, 'NONE', '95', 'NONE', 'italic')
call s:hi('Special', s:p.wood_jade, 'NONE', '23', 'NONE', 'NONE')
call s:hi('Delimiter', s:p.earth_delim, 'NONE', '101', 'NONE', 'NONE')
call s:hi('Underlined', s:p.wood_link, 'NONE', '60', 'NONE', 'underline')
call s:hi('Ignore', 'NONE', 'NONE', 'NONE', 'NONE', 'NONE')
call s:hi('Error', s:p.fire_busy, s:p.bg, '131', '254', 'bold')
call s:hi('Todo', s:p.wood_link, s:p.tint_todo, '60', '153', 'bold')
call s:hi('ErrorMsg', s:p.fire_busy, s:p.bg, '131', '254', 'bold')

" =============================================================================
" Editor UI
" =============================================================================
" Define muted colors for light mode cursor
let s:p.cursor_normal = '#cd5c5c' " Soft Terracotta (Normal/Exit)
let s:p.cursor_insert = '#6b8e23' " Muted Olive Green (Insert)

" Cursor settings - Using foreground from background (s:p.bg) for maximum legibility
call s:hi('Cursor', s:p.bg, s:p.cursor_normal, '254', '167', 'NONE')
call s:hi('lCursor', s:p.bg, s:p.cursor_normal, '254', '167', 'NONE')
call s:hi('TermCursor', s:p.bg, s:p.cursor_normal, '254', '167', 'NONE')
call s:hi('CursorIM', s:p.bg, s:p.cursor_insert, '254', '64', 'NONE')
" Inactive or specific UI cursors
call s:hi('TermCursorNC', s:p.fg_sub, s:p.bg_alt, '238', '188', 'NONE')
call s:hi('CursorLine', 'NONE', s:p.bg_alt, 'NONE', '188', 'NONE')
call s:hi('LineNr', s:p.earth_gutter, s:p.bg, '246', '254', 'NONE')
call s:hi('CursorLineNr', s:p.wood_link, s:p.bg_alt, '60', '188', 'bold')

" Statusline and Dividers
call s:hi('StatusLine', s:p.fg, s:p.bg_alt, '236', '188', 'bold')
call s:hi('StatusLineNC', s:p.fg_sub, s:p.bg_sub, '238', '255', 'NONE')
call s:hi('VertSplit', s:p.split, s:p.split, '251', '251', 'NONE')

" Menus and Selection
call s:hi('Pmenu', s:p.fg, s:p.bg_line, '236', '255', 'NONE')
call s:hi('PmenuSel', s:p.fg_bright, s:p.tint_pmsel, '235', '146', 'bold')
call s:hi('PmenuSbar', 'NONE', s:p.bg_alt, 'NONE', '188', 'NONE')
call s:hi('PmenuThumb', 'NONE', s:p.earth_gutter, 'NONE', '246', 'NONE')
call s:hi('Visual', 'NONE', s:p.bg_sel, 'NONE', '189', 'NONE')

" Search and Navigation
call s:hi('Search', s:p.fg_bright, s:p.tint_search, '235', '153', 'NONE')
call s:hi('IncSearch', s:p.fg_bright, s:p.tint_inc, '235', '152', 'bold')
call s:hi('NonText', s:p.earth_dust, 'NONE', '248', 'NONE', 'NONE')

" Folds and Columns
call s:hi('Folded', s:p.earth_literal, s:p.bg_alt, '94', '188', 'italic')
call s:hi('FoldColumn', s:p.earth_gutter, s:p.bg, '246', '254', 'NONE')
call s:hi('ColorColumn', 'NONE', s:p.bg_alt, 'NONE', '188', 'NONE')

" Messages and Others
call s:hi('MatchParen', s:p.fire_alarm, '#cfd5ea', '95', '189', 'bold')
call s:hi('Directory', s:p.wood_link, 'NONE', '60', 'NONE', 'bold')
call s:hi('Title', s:p.graphite, 'NONE', '239', 'NONE', 'bold')
call s:hi('MoreMsg', s:p.graphite, 'NONE', '239', 'NONE', 'bold')
call s:hi('ModeMsg', s:p.graphite, 'NONE', '239', 'NONE', 'bold')
call s:hi('Question', s:p.graphite, 'NONE', '239', 'NONE', 'bold')
call s:hi('WarningMsg', s:p.wood_link, 'NONE', '60', 'NONE', 'bold')
call s:hi('ErrorMsg', s:p.graphite, s:p.bg, '239', '254', 'bold')
"


" =============================================================================
" Diagnostics & Diff
" =============================================================================
if has('nvim')
  execute 'hi DiagnosticUnderlineError gui=undercurl guisp=' . s:p.graphite
  execute 'hi DiagnosticUnderlineWarn  gui=undercurl guisp=' . s:p.wood_link
  execute 'hi DiagnosticUnderlineInfo  gui=undercurl guisp=' . s:p.signal_blue
  execute 'hi DiagnosticUnderlineHint  gui=undercurl guisp=' . s:p.emerald
endif

call s:hi('DiffAdd', s:p.fg, '#dff3e4', '236', '194', 'NONE')
call s:hi('DiffChange', s:p.fg, '#dfe5fb', '236', '189', 'NONE')
call s:hi('DiffDelete', s:p.fg, '#f8d6d4', '236', '217', 'NONE')
call s:hi('DiffText', s:p.fg, '#f5e5c7', '236', '223', 'bold')

" =============================================================================
" Forced Highlighting Logic
" =============================================================================
call s:hi('FuncKey', s:p.muted_blue, 'NONE', '24', 'NONE', 'bold')

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

" --- Forced Highlighting Logic ---

if get(g:, 'seoulism_rigorous', 1)
    augroup SeoulismIntenseForce
        autocmd!
        autocmd FileType c,cpp,go,rust,java,python,typescript call s:ForceSeoulismTypes()
        autocmd BufEnter,WinEnter * if &filetype =~# 'c\|cpp\|go\|rust\|java\|python\|typescript' | call s:ForceSeoulismTypes() | endif
        autocmd BufEnter,WinEnter,Syntax go,c,cpp,rust,python call s:hi('FuncKey', s:p.muted_blue, 'NONE', '24', 'NONE', 'bold') | call s:ForceSeoulismJade()
    augroup END
endif



" Terminal colors
if has('nvim')
  let g:terminal_color_0 = s:p.bg
  let g:terminal_color_1 = s:p.fire_alarm
  let g:terminal_color_2 = s:p.emerald
  let g:terminal_color_3 = s:p.earth_literal
  let g:terminal_color_4 = s:p.wood_link
  let g:terminal_color_5 = s:p.fire_busy
  let g:terminal_color_6 = s:p.wood_jade
  let g:terminal_color_7 = s:p.fg
  let g:terminal_color_8 = s:p.charcoal
  let g:terminal_color_9 = s:p.fire_busy
endif

if get(g:, 'seoulism_rigorous', 1)
  call s:ForceSeoulismTypes()
endif
" Semantic & Language Server Protocol Groups
" =============================================================================
call s:hi('LspVariable', s:p.fg_sub, 'NONE', '238', 'NONE', 'NONE')
call s:hi('LspParameter', s:p.muted_blue, 'NONE', '24', 'NONE', 'italic')
call s:hi('LspKeyword', s:p.graphite, 'NONE', '239', 'NONE', 'bold')
call s:hi('LspControlFlow', s:p.graphite, 'NONE', '239', 'NONE', 'bold')
call s:hi('LspStaticVariable', s:p.wood_link, 'NONE', '60', 'NONE', 'bold')
call s:hi('LspEnumMember', s:p.wood_link, 'NONE', '60', 'NONE', 'NONE')
call s:hi('LspInterface', s:p.fire_alarm, 'NONE', '95', 'NONE', 'bold')
call s:hi('LspStruct', s:p.fire_alarm, 'NONE', '95', 'NONE', 'italic')
call s:hi('LspErrorText', s:p.graphite, 'NONE', '239', 'NONE', 'underline')
call s:hi('LspWarningText', s:p.wood_link, 'NONE', '60', 'NONE', 'underline')
execute 'highlight vimVar guifg=' . s:p.fire_alarm . ' gui=italic'
execute 'highlight vimFBVar guifg=' . s:p.fire_alarm . ' gui=italic'
execute 'highlight vimAmbiguousVimVar guifg=' . s:p.fire_alarm . ' gui=italic'
" --- Cursor Color Definitions for Light Mode ---

" Normal Mode: Muted Red (Soft Terracotta)
" We use a white foreground for better contrast against the colored block
execute 'highlight Cursor guifg=' . s:p.bg . ' guibg=' . s:p.cursor_normal
execute 'highlight CursorIM guifg=' . s:p.bg . ' guibg=' . s:p.cursor_normal

" Define colors as variables for easy maintenance
let s:insert_cursor_color = "#6b8e23" " Muted Olive Green
let s:normal_cursor_color = "#cd5c5c" " Soft Terracotta

" --- Advanced Cursor & IME Logic for Light Mode ---
"
if has("gui_running") || &termguicolors
    " Synchronize highlight groups
    execute 'hi Cursor guifg=' . s:p.bg . ' guibg=' . s:p.cursor_normal
    execute 'hi CursorIM guifg=' . s:p.bg . ' guibg=' . s:p.cursor_insert

    augroup SeoulismKonsoleIME
        autocmd!
        " Force-update CursorIM background on InsertEnter
        autocmd InsertEnter * execute 'hi CursorIM guibg=' . s:p.cursor_insert
    augroup END

    " Konsole specific: OS window title/color sequences
    " \e]12; sets the cursor color in many Xterm-compliant terminals including Konsole
    let &t_SI = "\e]12;" . s:p.cursor_insert . "\a"
    let &t_EI = "\e]12;" . s:p.cursor_normal . "\a"

    " Prevent Konsole from overriding cursor color during IME composition
    " This is a 'soft' reset sequence that works well with Qt-based terminals
    autocmd VimLeave * silent !echo -ne "\e]112\a"
endif


" --- Compatibility & Performance ---

" 1. Fast UI Response
" (Defaults kept to user preference)

" 2. Smart Redraw
" (Defaults kept to user preference)

" 3. Terminal Integration
" (Removed intrusive focus reporting)
