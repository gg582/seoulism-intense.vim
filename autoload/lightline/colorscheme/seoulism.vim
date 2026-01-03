" --- Lightline diagnostics: ALE + coc.nvim ---
" Show combined counts (ALE + coc) on the right.
" Hide when all zero.

function! LightlineCocDiag(kind) abort
  if !exists('*coc#rpc#ready') || !coc#rpc#ready()
    return 0
  endif

  " coc#status() is string; use diagnostics API for counts
  if exists('*CocAction')
    try
      let l:info = CocAction('diagnosticInfo')
      if type(l:info) == v:t_dict
        if a:kind ==# 'E' | return get(l:info, 'error', 0) | endif
        if a:kind ==# 'W' | return get(l:info, 'warning', 0) | endif
        if a:kind ==# 'I' | return get(l:info, 'information', 0) | endif
        if a:kind ==# 'H' | return get(l:info, 'hint', 0) | endif
      endif
    catch
    endtry
  endif

  return 0
endfunction

function! LightlineAleDiag(kind) abort
  if !exists('g:loaded_ale') || !exists('*ale#statusline#Count')
    return 0
  endif

  let l:counts = ale#statusline#Count(bufnr(''))
  if type(l:counts) != v:t_dict
    return 0
  endif

  if a:kind ==# 'E' | return get(l:counts, 'error', 0) | endif
  if a:kind ==# 'W' | return get(l:counts, 'warning', 0) | endif
  if a:kind ==# 'I' | return get(l:counts, 'info', 0) | endif
  if a:kind ==# 'H' | return get(l:counts, 'style_error', 0) + get(l:counts, 'style_warning', 0) | endif
  return 0
endfunction

function! LightlineDiag() abort
  let l:e = LightlineAleDiag('E') + LightlineCocDiag('E')
  let l:w = LightlineAleDiag('W') + LightlineCocDiag('W')
  let l:i = LightlineAleDiag('I') + LightlineCocDiag('I')
  let l:h = LightlineAleDiag('H') + LightlineCocDiag('H')

  let l:parts = []
  if l:e > 0 | call add(l:parts, 'E:' . l:e) | endif
  if l:w > 0 | call add(l:parts, 'W:' . l:w) | endif
  if l:i > 0 | call add(l:parts, 'I:' . l:i) | endif
  if l:h > 0 | call add(l:parts, 'H:' . l:h) | endif

  return empty(l:parts) ? '' : join(l:parts, ' ')
endfunction

" Tell lightline to refresh when diagnostics change
augroup LightlineDiagnostics
  autocmd!
  autocmd User CocDiagnosticChange,CocStatusChange call lightline#update()
  autocmd User ALELintPost call lightline#update()
augroup END

