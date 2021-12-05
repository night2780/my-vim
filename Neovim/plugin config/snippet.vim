scriptencoding utf-8
let s:is_vim = !has('nvim')
let s:map_next = 1

function! coc#snippet#_select_mappings()
  if !get(g:, 'coc_selectmode_mapping', 1)
    return
  endif

  redir => mappings
    silent! smap
  redir END

  for map in map(filter(split(mappings, '\n'),
        \ "v:val !~# '^s' && v:val !~# '^\\a*\\s*<\\S\\+>'"),
        \ "matchstr(v:val, '^\\a*\\s*\\zs\\S\\+')")
    silent! execute 'sunmap' map
    silent! execute 'sunmap <buffer>' map
  endfor

  " same behaviour of ultisnips
  snoremap <silent> <BS> <c-g>c
  snoremap <silent> <DEL> <c-g>c
  snoremap <silent> <c-h> <c-g>c
  snoremap <c-r> <c-g>"_c<c-r>
endfunction

function! coc#snippet#show_choices(lnum, col, len, values) abort
  let m = mode()
  call cursor(a:lnum, a:col + a:len)
  if m !=# 'i' | startinsert | endif
  call timer_start(20, { -> coc#_do_complete(a:col - 1, a:values, 0)})
  redraw
endfunction

function! coc#snippet#enable()
  if get(b:, 'coc_snippet_active', 0) == 1
    return
  endif
  let b:coc_snippet_active = 1
  silent! unlet g:coc_selected_text
  call coc#snippet#_select_mappings()
  let nextkey = get(g:, 'coc_snippet_next', '<C-j>')
  let prevkey = get(g:, 'coc_snippet_prev', '<C-k>')
  if maparg(nextkey, 'i') =~# 'expand-jump'
    let s:map_next = 0
  endif
  if s:map_next
    execute 'inoremap <buffer><nowait><silent>'.nextkey." <C-R>=coc#rpc#request('snippetNext', [])<cr>"
  endif
  execute 'inoremap <buffer><nowait><silent>'.prevkey." <C-R>=coc#rpc#request('snippetPrev', [])<cr>"
  execute 'snoremap <buffer><nowait><silent>'.prevkey." <Esc>:call coc#rpc#request('snippetPrev', [])<cr>"
  execute 'snoremap <buffer><nowait><silent>'.nextkey." <Esc>:call coc#rpc#request('snippetNext', [])<cr>"
endfunction

function! coc#snippet#disable()
  if get(b:, 'coc_snippet_active', 0) == 0
    return
  endif
  let b:coc_snippet_active = 0
  let nextkey = get(g:, 'coc_snippet_next', '<C-j>')
  let prevkey = get(g:, 'coc_snippet_prev', '<C-k>')
  if s:map_next
    silent! execute 'iunmap <buffer> <silent> '.nextkey
  endif
  silent! execute 'iunmap <buffer> <silent> '.prevkey
  silent! execute 'sunmap <buffer> <silent> '.prevkey
  silent! execute 'sunmap <buffer> <silent> '.nextkey
endfunction

imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
imap <C-j> <Plug>(coc-snippets-expand-jump)
" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'
