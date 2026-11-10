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
" Ergonomic revision mirrored from seoulism (dark): every accent keeps its
" original OKLCH hue and (near) full chroma, but lightness is pulled down so
" syntax sits at WCAG ~6:1 on a lighter field (ink ~12.5:1, comments ~5.2:1,
" delimiters ~4.5:1, gutter ~3.3:1). Bright-but-low-contrast accents, the
" main source of glare, are removed rather than desaturated.
let s:p.metal_field  = '#f2f0ed'
let s:p.metal_edge   = '#e9e6e2'
let s:p.metal_mute   = '#ebe0e1'
let s:p.bg           = s:p.metal_field
let s:p.bg_sub       = '#f8f6f4'
let s:p.bg_alt       = s:p.metal_mute
let s:p.bg_sel       = '#bbc5ef'
let s:p.bg_line      = s:p.metal_edge

let s:p.water_ink    = '#25231f'
let s:p.water_graphite = '#403d36'
let s:p.fg           = s:p.water_ink
let s:p.fg_sub       = '#33302b'
let s:p.fg_bright    = '#151411'
let s:p.graphite     = s:p.water_graphite

let s:p.fire_alarm   = '#a81813'
let s:p.fire_busy    = '#b80216'
let s:p.wood_jade    = '#005f58'
let s:p.wood_link    = '#2949bf'
let s:p.emerald      = '#01643c'
let s:p.earth_literal = '#814d01'
let s:p.earth_gold   = '#6b5420'
let s:p.earth_comment = '#745a26'
let s:p.earth_delim  = '#79653e'
let s:p.earth_gutter = '#8b7b5e'
let s:p.earth_dust   = '#9d9079'
let s:p.muted_blue   = '#325685'
let s:p.charcoal     = '#8b8378'
let s:p.signal_blue  = '#364fbc'
let s:p.cursor_blue  = '#add8e6'
let s:p.split        = '#d5d0ca'

" Soft tints (same hues) for filled highlights instead of solid saturated blocks
let s:p.tint_search  = '#9db9fc'
let s:p.tint_inc     = '#71cec4'
let s:p.tint_pmsel   = '#8eacf4'
let s:p.tint_todo    = '#adc3f9'

function! s:hi(group, guifg, guibg, ctermfg, ctermbg, attr) abort
  execute 'hi' a:group
        \ 'gui=' . a:attr . ' cterm=' . a:attr
        \ 'guifg=' . a:guifg . ' guibg=' . a:guibg
        \ 'ctermfg=' . a:ctermfg . ' ctermbg=' . a:ctermbg
endfunction

" =============================================================================
" Core Syntax
" =============================================================================
call s:hi('Normal', s:p.fg, s:p.bg, '235', '255', 'NONE')
call s:hi('NormalNC', s:p.fg_sub, s:p.bg, '236', '255', 'NONE')
call s:hi('Comment', s:p.earth_comment, 'NONE', '94', 'NONE', 'italic')
call s:hi('Constant', s:p.signal_blue, 'NONE', '25', 'NONE', 'NONE')
call s:hi('String', s:p.wood_link, 'NONE', '26', 'NONE', 'NONE')
call s:hi('Character', s:p.wood_jade, 'NONE', '23', 'NONE', 'NONE')
call s:hi('Number', s:p.emerald, 'NONE', '22', 'NONE', 'NONE')
call s:hi('Boolean', s:p.wood_jade, 'NONE', '23', 'NONE', 'NONE')
call s:hi('Float', s:p.emerald, 'NONE', '22', 'NONE', 'NONE')
call s:hi('Identifier', s:p.fg, 'NONE', '235', 'NONE', 'NONE')
call s:hi('Function', s:p.muted_blue, 'NONE', '24', 'NONE', 'bold')

call s:hi('Statement', s:p.graphite, 'NONE', '237', 'NONE', 'bold')
call s:hi('Conditional', s:p.graphite, 'NONE', '237', 'NONE', 'bold')
call s:hi('Repeat', s:p.graphite, 'NONE', '237', 'NONE', 'bold')
call s:hi('Keyword', s:p.graphite, 'NONE', '237', 'NONE', 'bold')
call s:hi('Label', s:p.graphite, 'NONE', '237', 'NONE', 'NONE')
call s:hi('Exception', s:p.graphite, 'NONE', '237', 'NONE', 'bold')

call s:hi('Operator', s:p.graphite, 'NONE', '237', 'NONE', 'NONE')
call s:hi('PreProc', s:p.wood_jade, 'NONE', '23', 'NONE', 'NONE')
call s:hi('Include', s:p.wood_jade, 'NONE', '23', 'NONE', 'NONE')
call s:hi('Define', s:p.wood_jade, 'NONE', '23', 'NONE', 'NONE')
call s:hi('Macro', s:p.wood_jade, 'NONE', '23', 'NONE', 'NONE')
call s:hi('PreCondit', s:p.wood_jade, 'NONE', '23', 'NONE', 'NONE')
call s:hi('Type', s:p.fire_alarm, 'NONE', '124', 'NONE', 'italic')
call s:hi('StorageClass', s:p.fire_alarm, 'NONE', '124', 'NONE', 'italic')
call s:hi('Structure', s:p.fire_alarm, 'NONE', '124', 'NONE', 'italic')
call s:hi('Typedef', s:p.fire_alarm, 'NONE', '124', 'NONE', 'italic')
call s:hi('Special', s:p.wood_jade, 'NONE', '23', 'NONE', 'NONE')
call s:hi('Delimiter', s:p.earth_delim, 'NONE', '94', 'NONE', 'NONE')
call s:hi('Underlined', s:p.wood_link, 'NONE', '26', 'NONE', 'underline')
call s:hi('Ignore', 'NONE', 'NONE', 'NONE', 'NONE', 'NONE')
call s:hi('Error', s:p.fire_busy, s:p.bg, '124', '255', 'bold')
call s:hi('Todo', s:p.wood_link, s:p.tint_todo, '26', '153', 'bold')
call s:hi('ErrorMsg', s:p.fire_busy, s:p.bg, '124', '255', 'bold')

" =============================================================================
" Editor UI
" =============================================================================
" Define muted colors for light mode cursor
let s:p.cursor_normal = '#cd5c5c' " Soft Terracotta (Normal/Exit)
let s:p.cursor_insert = '#6b8e23' " Muted Olive Green (Insert)

" Cursor settings - Using foreground from background (s:p.bg) for maximum legibility
call s:hi('Cursor', s:p.bg, s:p.cursor_normal, '255', '167', 'NONE')
call s:hi('lCursor', s:p.bg, s:p.cursor_normal, '255', '167', 'NONE')
call s:hi('TermCursor', s:p.bg, s:p.cursor_normal, '255', '167', 'NONE')
call s:hi('CursorIM', s:p.bg, s:p.cursor_insert, '255', '64', 'NONE')
" Inactive or specific UI cursors
call s:hi('TermCursorNC', s:p.fg_sub, s:p.bg_alt, '236', '254', 'NONE')
call s:hi('CursorLine', 'NONE', s:p.bg_alt, 'NONE', '254', 'NONE')
call s:hi('LineNr', s:p.earth_gutter, s:p.bg, '101', '255', 'NONE')
call s:hi('CursorLineNr', s:p.wood_link, s:p.bg_alt, '26', '254', 'bold')

" Statusline and Dividers
call s:hi('StatusLine', s:p.fg, s:p.bg_alt, '235', '254', 'bold')
call s:hi('StatusLineNC', s:p.fg_sub, s:p.bg_sub, '236', '255', 'NONE')
call s:hi('VertSplit', s:p.split, s:p.split, '252', '252', 'NONE')

" Menus and Selection
call s:hi('Pmenu', s:p.fg, s:p.bg_line, '235', '254', 'NONE')
call s:hi('PmenuSel', s:p.fg_bright, s:p.tint_pmsel, '233', '111', 'bold')
call s:hi('PmenuSbar', 'NONE', s:p.bg_alt, 'NONE', '254', 'NONE')
call s:hi('PmenuThumb', 'NONE', s:p.earth_gutter, 'NONE', '101', 'NONE')
call s:hi('Visual', 'NONE', s:p.bg_sel, 'NONE', '153', 'NONE')

" Search and Navigation
call s:hi('Search', s:p.fg_bright, s:p.tint_search, '233', '147', 'NONE')
call s:hi('IncSearch', s:p.fg_bright, s:p.tint_inc, '233', '80', 'bold')
call s:hi('NonText', s:p.earth_dust, 'NONE', '246', 'NONE', 'NONE')

" Folds and Columns
call s:hi('Folded', s:p.earth_literal, s:p.bg_alt, '94', '254', 'italic')
call s:hi('FoldColumn', s:p.earth_gutter, s:p.bg, '101', '255', 'NONE')
call s:hi('ColorColumn', 'NONE', s:p.bg_alt, 'NONE', '254', 'NONE')

" Messages and Others
call s:hi('MatchParen', s:p.fire_alarm, '#c6cff0', '124', '189', 'bold')
call s:hi('Directory', s:p.wood_link, 'NONE', '26', 'NONE', 'bold')
call s:hi('Title', s:p.graphite, 'NONE', '237', 'NONE', 'bold')
call s:hi('MoreMsg', s:p.graphite, 'NONE', '237', 'NONE', 'bold')
call s:hi('ModeMsg', s:p.graphite, 'NONE', '237', 'NONE', 'bold')
call s:hi('Question', s:p.graphite, 'NONE', '237', 'NONE', 'bold')
call s:hi('WarningMsg', s:p.wood_link, 'NONE', '26', 'NONE', 'bold')
call s:hi('ErrorMsg', s:p.graphite, s:p.bg, '237', '255', 'bold')
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

call s:hi('DiffAdd', s:p.fg, '#dff3e4', '235', '194', 'NONE')
call s:hi('DiffChange', s:p.fg, '#dfe5fb', '235', '189', 'NONE')
call s:hi('DiffDelete', s:p.fg, '#f8d6d4', '235', '217', 'NONE')
call s:hi('DiffText', s:p.fg, '#f5e5c7', '235', '223', 'bold')

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
call s:hi('LspVariable', s:p.fg_sub, 'NONE', '236', 'NONE', 'NONE')
call s:hi('LspParameter', s:p.muted_blue, 'NONE', '24', 'NONE', 'italic')
call s:hi('LspKeyword', s:p.graphite, 'NONE', '237', 'NONE', 'bold')
call s:hi('LspControlFlow', s:p.graphite, 'NONE', '237', 'NONE', 'bold')
call s:hi('LspStaticVariable', s:p.wood_link, 'NONE', '26', 'NONE', 'bold')
call s:hi('LspEnumMember', s:p.wood_link, 'NONE', '26', 'NONE', 'NONE')
call s:hi('LspInterface', s:p.fire_alarm, 'NONE', '124', 'NONE', 'bold')
call s:hi('LspStruct', s:p.fire_alarm, 'NONE', '124', 'NONE', 'italic')
call s:hi('LspErrorText', s:p.graphite, 'NONE', '237', 'NONE', 'underline')
call s:hi('LspWarningText', s:p.wood_link, 'NONE', '26', 'NONE', 'underline')
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
