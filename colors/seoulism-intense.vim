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
let s:p.metal_field  = '#dddbd5'
let s:p.metal_edge   = '#f1ebdd'
let s:p.metal_mute   = '#bdb4b5'
let s:p.bg           = s:p.metal_field
let s:p.bg_sub       = '#f7f2e8'
let s:p.bg_alt       = s:p.metal_mute
let s:p.bg_sel       = '#d5ddff'
let s:p.bg_line      = s:p.metal_edge

let s:p.water_ink    = '#111111'
let s:p.water_graphite = '#4c4943'
let s:p.fg           = s:p.water_ink
let s:p.fg_sub       = '#2d2a24'
let s:p.fg_bright    = '#000000'
let s:p.graphite     = s:p.water_graphite

let s:p.fire_alarm   = '#b0231b'
let s:p.fire_busy    = '#d32f2f'
let s:p.wood_jade    = '#147a72'
let s:p.wood_link    = '#2b4cc2'
let s:p.emerald      = '#1b9c62'
let s:p.earth_literal = '#9f641a'
let s:p.earth_gold   = '#926f1f'
let s:p.muted_blue   = '#4a6f9f'
let s:p.charcoal     = '#9a9186'
let s:p.signal_blue  = '#4b68d8'
let s:p.cursor_blue  = '#add8e6'

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
call s:hi('Comment', s:p.earth_gold, 'NONE', '178', 'NONE', 'italic')
call s:hi('Constant', s:p.signal_blue, 'NONE', '33', 'NONE', 'NONE')
call s:hi('String', s:p.wood_link, 'NONE', '33', 'NONE', 'NONE')
call s:hi('Character', s:p.wood_jade, 'NONE', '29', 'NONE', 'NONE')
call s:hi('Number', s:p.emerald, 'NONE', '33', 'NONE', 'NONE')
call s:hi('Boolean', s:p.wood_jade, 'NONE', '29', 'NONE', 'NONE')
call s:hi('Float', s:p.emerald, 'NONE', '33', 'NONE', 'NONE')
call s:hi('Identifier', s:p.fg, 'NONE', '235', 'NONE', 'NONE')
call s:hi('Function', s:p.muted_blue, 'NONE', '103', 'NONE', 'bold')

call s:hi('Statement', s:p.graphite, 'NONE', '238', 'NONE', 'bold')
call s:hi('Conditional', s:p.graphite, 'NONE', '238', 'NONE', 'bold')
call s:hi('Repeat', s:p.graphite, 'NONE', '238', 'NONE', 'bold')
call s:hi('Keyword', s:p.graphite, 'NONE', '238', 'NONE', 'bold')
call s:hi('Label', s:p.graphite, 'NONE', '238', 'NONE', 'NONE')
call s:hi('Exception', s:p.graphite, 'NONE', '238', 'NONE', 'bold')

call s:hi('Operator', s:p.graphite, 'NONE', '238', 'NONE', 'NONE')
call s:hi('PreProc', s:p.wood_jade, 'NONE', '33', 'NONE', 'NONE')
call s:hi('Include', s:p.wood_jade, 'NONE', '33', 'NONE', 'NONE')
call s:hi('Define', s:p.wood_jade, 'NONE', '33', 'NONE', 'NONE')
call s:hi('Macro', s:p.wood_jade, 'NONE', '33', 'NONE', 'NONE')
call s:hi('PreCondit', s:p.wood_jade, 'NONE', '33', 'NONE', 'NONE')
call s:hi('Type', s:p.fire_alarm, 'NONE', '124', 'NONE', 'italic')
call s:hi('StorageClass', s:p.fire_alarm, 'NONE', '124', 'NONE', 'italic')
call s:hi('Structure', s:p.fire_alarm, 'NONE', '124', 'NONE', 'italic')
call s:hi('Typedef', s:p.fire_alarm, 'NONE', '124', 'NONE', 'italic')
call s:hi('Special', s:p.wood_jade, 'NONE', '29', 'NONE', 'NONE')
call s:hi('Delimiter', s:p.earth_gold, 'NONE', '178', 'NONE', 'NONE')
call s:hi('Underlined', s:p.wood_link, 'NONE', '33', 'NONE', 'underline')
call s:hi('Ignore', 'NONE', 'NONE', 'NONE', 'NONE', 'NONE')
call s:hi('Error', s:p.fire_busy, s:p.bg, '160', '231', 'bold')
call s:hi('Todo', s:p.bg, s:p.wood_link, '231', '33', 'bold')
call s:hi('ErrorMsg', s:p.fire_busy, s:p.bg, '160', '231', 'bold')

" =============================================================================
" Editor UI
" =============================================================================
" Define muted colors for light mode cursor
let s:p.cursor_normal = '#cd5c5c' " Soft Terracotta (Normal/Exit)
let s:p.cursor_insert = '#6b8e23' " Muted Olive Green (Insert)

" Cursor settings - Using foreground from background (s:p.bg) for maximum legibility
call s:hi('Cursor', s:p.bg, s:p.cursor_normal, '231', '167', 'NONE')
call s:hi('lCursor', s:p.bg, s:p.cursor_normal, '231', '167', 'NONE')
call s:hi('TermCursor', s:p.bg, s:p.cursor_normal, '231', '167', 'NONE')
call s:hi('CursorIM', s:p.bg, s:p.cursor_insert, '231', '64', 'NONE')
" Inactive or specific UI cursors
call s:hi('TermCursorNC', s:p.fg_sub, s:p.bg_alt, '235', '188', 'NONE')
call s:hi('CursorLine', 'NONE', s:p.bg_alt, 'NONE', '188', 'NONE')
call s:hi('LineNr', s:p.earth_gold, s:p.bg, '178', '231', 'NONE')
call s:hi('CursorLineNr', s:p.wood_link, s:p.bg_alt, '33', '188', 'bold')

" Statusline and Dividers
call s:hi('StatusLine', s:p.fg, s:p.bg_alt, '16', '188', 'bold')
call s:hi('StatusLineNC', s:p.fg_sub, s:p.bg_sub, '235', '230', 'NONE')
call s:hi('VertSplit', '#d7cbb9', '#d7cbb9', '187', '187', 'NONE')

" Menus and Selection
call s:hi('Pmenu', s:p.fg, s:p.bg_line, '16', '254', 'NONE')
call s:hi('PmenuSel', s:p.bg, s:p.wood_link, '231', '26', 'bold')
call s:hi('PmenuSbar', 'NONE', s:p.bg_alt, 'NONE', '188', 'NONE')
call s:hi('PmenuThumb', 'NONE', s:p.earth_gold, 'NONE', '178', 'NONE')
call s:hi('Visual', 'NONE', s:p.bg_sel, 'NONE', '153', 'NONE')

" Search and Navigation
call s:hi('Search', s:p.bg, s:p.wood_link, '231', '33', 'bold')
call s:hi('IncSearch', s:p.bg, s:p.wood_jade, '231', '29', 'NONE')
call s:hi('NonText', s:p.earth_gold, 'NONE', '178', 'NONE', 'NONE')

" Folds and Columns
call s:hi('Folded', s:p.earth_literal, s:p.bg_alt, '172', '188', 'italic')
call s:hi('FoldColumn', s:p.earth_gold, s:p.bg, '178', '231', 'NONE')
call s:hi('ColorColumn', 'NONE', s:p.bg_alt, 'NONE', '188', 'NONE')

" Messages and Others
call s:hi('MatchParen', s:p.fire_alarm, '#cfd7f2', '124', '189', 'bold')
call s:hi('Directory', s:p.wood_link, 'NONE', '33', 'NONE', 'bold')
call s:hi('Title', s:p.graphite, 'NONE', '238', 'NONE', 'bold')
call s:hi('MoreMsg', s:p.graphite, 'NONE', '238', 'NONE', 'bold')
call s:hi('ModeMsg', s:p.graphite, 'NONE', '238', 'NONE', 'bold')
call s:hi('Question', s:p.graphite, 'NONE', '238', 'NONE', 'bold')
call s:hi('WarningMsg', s:p.wood_link, 'NONE', '33', 'NONE', 'bold')
call s:hi('ErrorMsg', s:p.graphite, s:p.bg, '238', '231', 'bold')
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

call s:hi('DiffAdd', s:p.fg, '#dff3e4', '16', '194', 'NONE')
call s:hi('DiffChange', s:p.fg, '#dfe5fb', '16', '189', 'NONE')
call s:hi('DiffDelete', s:p.fg, '#f8d6d4', '16', '217', 'NONE')
call s:hi('DiffText', s:p.fg, '#f5e5c7', '16', '223', 'bold')

" =============================================================================
" Forced Highlighting Logic
" =============================================================================
call s:hi('FuncKey', s:p.muted_blue, 'NONE', '103', 'NONE', 'bold')

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
  autocmd BufEnter,WinEnter,Syntax go,c,cpp,rust,python call s:hi('FuncKey', s:p.muted_blue, 'NONE', '103', 'NONE', 'bold') | call s:ForceSeoulismJade()
augroup END

" Terminal colors
if has('nvim')
  let g:terminal_color_0 = s:p.bg
  let g:terminal_color_1 = s:p.fire_alarm
  let g:terminal_color_2 = s:p.emerald
  let g:terminal_color_3 = s:p.earth_literal
  let g:terminal_color_4 = s:p.wood_link
  let g:terminal_color_5 = '#c93f2f'
  let g:terminal_color_6 = s:p.wood_jade
  let g:terminal_color_7 = s:p.fg
  let g:terminal_color_8 = s:p.charcoal
  let g:terminal_color_9 = '#c93f2f'
endif

call s:ForceSeoulismTypes()

" =============================================================================
" Semantic & Language Server Protocol Groups
" =============================================================================
call s:hi('LspVariable', s:p.fg_sub, 'NONE', '235', 'NONE', 'NONE')
call s:hi('LspParameter', s:p.muted_blue, 'NONE', '103', 'NONE', 'italic')
call s:hi('LspKeyword', s:p.graphite, 'NONE', '238', 'NONE', 'bold')
call s:hi('LspControlFlow', s:p.graphite, 'NONE', '238', 'NONE', 'bold')
call s:hi('LspStaticVariable', s:p.wood_link, 'NONE', '33', 'NONE', 'bold')
call s:hi('LspEnumMember', s:p.wood_link, 'NONE', '33', 'NONE', 'NONE')
call s:hi('LspInterface', s:p.fire_alarm, 'NONE', '124', 'NONE', 'bold')
call s:hi('LspStruct', s:p.fire_alarm, 'NONE', '124', 'NONE', 'italic')
call s:hi('LspErrorText', s:p.graphite, 'NONE', '238', 'NONE', 'underline')
call s:hi('LspWarningText', s:p.wood_link, 'NONE', '33', 'NONE', 'underline')
highlight vimVar guifg=#b0231b gui=italic
highlight vimFBVar guifg=#b0231b gui=italic
highlight vimAmbiguousVimVar guifg=#b0231b gui=italic
" --- Cursor Color Definitions for Light Mode ---

" Normal Mode: Muted Red (Soft Terracotta)
" We use a white foreground for better contrast against the colored block
highlight Cursor guifg=#ffffff guibg=#cd5c5c
highlight CursorIM guifg=#ffffff guibg=#cd5c5c

" Define colors as variables for easy maintenance
let s:insert_cursor_color = "#6b8e23" " Muted Olive Green
let s:normal_cursor_color = "#cd5c5c" " Soft Terracotta

" --- Advanced Cursor & IME Logic for Light Mode ---
"
if has("gui_running") || &termguicolors
    " Force guicursor to use CursorIM for Insert/Command-line modes
    set guicursor=n-v-c:block-Cursor,i-ci-ve:block-CursorIM,r-cr-o:hor20

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


" --- Kitty Compatibility ---

" 1. Fast UI Response (Lowers delays for key sequences)
set updatetime=100
set ttimeoutlen=10

" 2. Smart Redraw (GPU optimization for large files)
set lazyredraw
set synmaxcol=300

" 3. Kitty Protocol Integration
" Enable bracketed paste and focus reporting
if &term =~# 'kitty'
    let &t_FE = "\e[?1004h"
    let &t_FD = "\e[?1004l"
    execute "set <FocusGained>=\e[I"
    execute "set <FocusLost>=\e[O"
endif

" 4. Enhanced Visual Feedback for Search
" Temporarily highlight search results, then fade out
augroup DynamicSearch
    autocmd!
    autocmd CmdlineEnter /,\? set hlsearch
    autocmd CursorMoved * set nohlsearch
augroup END

" 5. Advanced Cursor Logic (Overriding Everything)
" This ensures that even under heavy load, the cursor remains responsive
if has('nvim')
    set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci-ve:ver25-CursorIM-blinkwait10-blinkoff100-blinkon100,r-cr:hor20,o:hor50
endif
