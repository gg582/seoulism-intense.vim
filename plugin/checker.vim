" =============================================================================
" Seoulism Elemental Overcoming Checker
" Description: Monitors syntax balance and analyzes file characteristics.
" =============================================================================

if exists('g:loaded_seoulism_checker') | finish | endif
let g:loaded_seoulism_checker = 1

" --- Configuration ---
let g:seoulism_warn_opp = 1
let g:seoulism_opp_threshold = 10.0

" --- Visual Setup ---
highlight SeoulismWarn ctermfg=Yellow guifg=Yellow
sign define SeoulismSign text=☯ texthl=SeoulismWarn

" --- Element Group Mapping ---
let s:elements = {
    \ 'WOOD':  ['Function', 'Identifier'],
    \ 'FIRE':  ['Statement', 'Conditional', 'Repeat', 'Exception'],
    \ 'EARTH': ['Constant', 'String', 'Number', 'Boolean', 'Float'],
    \ 'METAL': ['Type', 'StorageClass', 'Structure', 'Typedef'],
    \ 'WATER': ['Comment', 'Special', 'Delimiter']
    \ }

" --- Overcoming Logic ---
let s:overcomes = {
    \ 'WOOD':  'EARTH',
    \ 'EARTH': 'WATER',
    \ 'WATER': 'FIRE',
    \ 'FIRE':  'METAL',
    \ 'METAL': 'WOOD'
    \ }

function! s:CheckBalance() abort
    " Clear existing sign
    execute 'sign unplace 999 buffer=' . bufnr('%')
    
    if !g:seoulism_warn_opp | return | endif

    let [l:stats, l:total] = s:GetStats()
    if l:total == 0 | return | endif

    " Detect overwhelming syntax groups
    for [l:attacker, l:victim] in items(s:overcomes)
        let l:p_attacker = (l:stats[l:attacker] * 100.0) / l:total
        let l:p_victim   = (l:stats[l:victim] * 100.0) / l:total
        let l:diff = l:p_attacker - l:p_victim

        if l:diff > g:seoulism_opp_threshold
            execute 'sign place 999 line=1 name=SeoulismSign buffer=' . bufnr('%')
            echo printf("[Seoulism] %s dominance detected (%.1f%% diff over %s)", l:attacker, l:diff, l:victim)
            return
        endif
    endfor
endfunction

function! s:GetStats() abort
    let l:stats = {'WOOD': 0, 'FIRE': 0, 'EARTH': 0, 'METAL': 0, 'WATER': 0}
    let l:total = 0
    let l:first = line('w0')
    let l:last = line('w$')

    for l:lnum in range(l:first, l:last)
        let l:width = col([l:lnum, '$'])
        for l:cnum in range(1, l:width, 10) " Sampling for performance
            let l:hi_id = synID(l:lnum, l:cnum, 1)
            let l:hi_name = synIDattr(synIDtrans(l:hi_id), 'name')
            
            for [l:el, l:groups] in items(s:elements)
                for l:group in l:groups
                    if l:hi_name =~# l:group
                        let l:stats[l:el] += 1
                        let l:total += 1
                        break
                    endif
                endfor
            endfor
        endfor
    endfor
    return [l:stats, l:total]
endfunction

function! SeoulismFullAnalysis() abort
    let [l:stats, l:total] = s:GetStats()
    if l:total == 0 | echo "No syntax data available." | return | endif

    echo "--- Syntax Distribution Report ---"
    for l:el in ['WOOD', 'FIRE', 'EARTH', 'METAL', 'WATER']
        let l:p = (l:stats[l:el] * 100.0) / l:total
        echo printf("%-6s: [%-20s] %.1f%%", l:el, repeat('#', float2nr(l:p / 5)), l:p)
    endfor
    echo "----------------------------------"

    " --- Structural Characteristics Analysis ---
    if l:stats['WATER'] > (l:total * 0.4)
        echo "Structural Profile: Documentation-heavy (Header or verbose comments detected)."
    elseif l:stats['FIRE'] > (l:total * 0.3)
        echo "Structural Profile: Control-flow intensive (High density of logic statements)."
    elseif l:stats['EARTH'] > (l:total * 0.4)
        echo "Structural Profile: Data-centric (Significant constant or string usage)."
    elseif l:stats['METAL'] > (l:total * 0.3)
        echo "Structural Profile: Definition-heavy (Type declarations or storage classes)."
    elseif l:stats['WOOD'] > (l:total * 0.3)
        echo "Structural Profile: Identifier-rich (High density of function calls/references)."
    else
        echo "Structural Profile: Balanced syntax distribution."
    endif
endfunction

" --- User Commands ---
command! Opp let g:seoulism_warn_opp = 1 | call s:CheckBalance()
command! NoOpp let g:seoulism_warn_opp = 0 | execute 'sign unplace 999 buffer=' . bufnr('%') | echo "[Seoulism] Disabled."
command! WarnCfgOpp let g:seoulism_opp_threshold = str2float(<q-args>) | call s:CheckBalance()
command! SeoulismStatus call SeoulismFullAnalysis()

" Command abbreviations
cnoreabbrev wopp Opp
cnoreabbrev noopp NoOpp
cnoreabbrev warncfg WarnCfgOpp

" --- Autocommands ---
augroup SeoulismChecker
    autocmd!
    autocmd BufWritePost,CursorHold * call s:CheckBalance()
augroup END
