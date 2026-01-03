" =============================================================================
" Seoulism Structural Balance Checker (Optimized for Clarity)
" =============================================================================
" This script analyzes code structure based on the 'Five Directional Colors'
" and 'Scene First, Emotion Later' philosophy of the Seoulism theme.

if exists('g:loaded_seoulism_checker') | finish | endif
let g:loaded_seoulism_checker = 1

" --- Configuration ---
if !exists('g:seoulism_warn_opp') | let g:seoulism_warn_opp = 1 | endif
" Higher threshold reduces false positives from structural noise.
if !exists('g:seoulism_opp_threshold') | let g:seoulism_opp_threshold = 25.0 | endif

" --- Sampling Settings ---
" Reduced step size to capture short keywords (if/for) more accurately.
if !exists('g:seoulism_sample_step') | let g:seoulism_sample_step = 2 | endif
if !exists('g:seoulism_sign_text') | let g:seoulism_sign_text = '◆' | endif

" --- Scope Mapping ---
if !exists('g:seoulism_scope') | let g:seoulism_scope = 'context' | endif
if !exists('g:seoulism_context_lines') | let g:seoulism_context_lines = 80 | endif

highlight SeoulismWarn ctermfg=180 guifg=#e5c15a
execute 'sign define SeoulismSign text=' . g:seoulism_sign_text . ' texthl=SeoulismWarn'

" Elements categorized by Wu Xing (Five Elements) logic
" Note: Delimiters are excluded from META to prevent skewed 'Annotation-heavy' results.
let s:elements = {
    \ 'FUNCTION': ['Function', 'Identifier'],
    \ 'CONTROL':  ['Statement', 'Conditional', 'Repeat', 'Exception'],
    \ 'DATA':      ['Constant', 'String', 'Number', 'Boolean', 'Float'],
    \ 'TYPE':      ['Type', 'StorageClass', 'Structure', 'Typedef'],
    \ 'META':      ['Comment', 'Special']
    \ }

" Generative cycle for dominance checking (e.g., WOOD -> EARTH)
let s:dominance = {
    \ 'FUNCTION': 'DATA',
    \ 'DATA':     'META',
    \ 'META':     'CONTROL',
    \ 'CONTROL':  'TYPE',
    \ 'TYPE':     'FUNCTION'
    \ }

function! s:ScanRange(first, last) abort
    let l:stats = {'FUNCTION': 0, 'CONTROL': 0, 'DATA': 0, 'TYPE': 0, 'META': 0}
    let l:total = 0

    for l:lnum in range(a:first, a:last)
        let l:line_str = getline(l:lnum)
        if empty(trim(l:line_str)) | continue | endif " Skip empty lines for cleaner stats

        let l:width = col([l:lnum, '$'])
        for l:cnum in range(1, l:width, g:seoulism_sample_step)
            let l:hi_id = synID(l:lnum, l:cnum, 1)
            let l:hi_name = synIDattr(synIDtrans(l:hi_id), 'name')

            if l:hi_name ==# '' || l:hi_name ==# 'Delimiter' | continue | endif

            for [l:el, l:groups] in items(s:elements)
                let l:matched = 0
                for l:group in l:groups
                    if l:hi_name =~# l:group
                        let l:stats[l:el] += 1
                        let l:total += 1
                        let l:matched = 1
                        break
                    endif
                endfor
                if l:matched | break | endif
            endfor
        endfor
    endfor
    return [l:stats, l:total]
endfunction

function! s:RealTimeCheck() abort
    if !g:seoulism_warn_opp | return | endif

    let l:cur = line('.')
    let l:first = max([1, l:cur - g:seoulism_context_lines])
    let l:last  = min([line('$'), l:cur + g:seoulism_context_lines])

    let [l:stats, l:total] = s:ScanRange(l:first, l:last)
    if l:total == 0 | return | endif

    " Calculate percentages for UI reporting
    let l:p = {}
    for l:k in keys(l:stats)
        let l:p[l:k] = (l:stats[l:k] * 100.0) / l:total
    endfor

    " --- Refined Profile Logic ---
    " Increased thresholds to better reflect actual code tendencies.
    let l:profile = 'Balanced'
    if l:p['META'] > 60.0    | let l:profile = 'Annotation-heavy'
    elseif l:p['CONTROL'] > 35.0 | let l:profile = 'Flow-heavy'
    elseif l:p['DATA'] > 50.0    | let l:profile = 'Data-centric'
    elseif l:p['TYPE'] > 40.0    | let l:profile = 'Definition-heavy'
    endif

    " --- Dominance & Sign Placement ---
    let l:dom_msg = ''
    silent! execute 'sign unplace * group=SeoulismOpp buffer=' . bufnr('%')

    for [l:leader, l:follower] in items(s:dominance)
        if (l:p[l:leader] - l:p[l:follower]) > g:seoulism_opp_threshold
            execute 'sign place 999 group=SeoulismOpp line=' . line('.') . ' name=SeoulismSign buffer=' . bufnr('%')
            let l:dom_msg = printf(' | Dominance: %s > %s', l:leader, l:follower)
            break
        endif
    endfor

    let l:msg = printf('[Seoulism] %s | Profile: %s | FUNC %.1f%% CTRL %.1f%% DATA %.1f%% TYPE %.1f%% META %.1f%%%s',
        \ g:seoulism_scope, l:profile, l:p['FUNCTION'], l:p['CONTROL'], l:p['DATA'], l:p['TYPE'], l:p['META'], l:dom_msg)

    if !exists('b:seoulism_last_msg') || l:msg !=# b:seoulism_last_msg
        let b:seoulism_last_msg = l:msg
        echo l:msg
    endif
endfunction

" Commands & Autocmds
command! Opp let g:seoulism_warn_opp = 1 | call s:RealTimeCheck()
command! NoOpp let g:seoulism_warn_opp = 0 | silent! execute 'sign unplace * group=SeoulismOpp buffer=' . bufnr('%')

augroup SeoulismRealTime
    autocmd!
    autocmd CursorHold,CursorHoldI,BufWritePost * call s:RealTimeCheck()
augroup END
