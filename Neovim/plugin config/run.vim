" Settings
let s:run_mapping = exists('g:run_mapping') ? g:run_mapping : 'go'
let s:run_debug = exists('g:run_debug') ? g:run_debug : 0

" Mappings
if s:run_debug
  execute 'nnoremap '.s:run_mapping.' :call run#Run()<cr>'
else
  execute 'nnoremap<silent> '.s:run_mapping.' :silent call run#Run()<cr>'
endif

" Autocmds
if exists("g:run_cmd")
  augroup vim_run
    autocmd!
    let filetypes = join(filter(keys(g:run_cmd), 'v:val !~ "_plus"'), ',')
    execute "autocmd FileType ".filetypes." :call run#Update()"
  augroup end
endif
let g:run_cmd = {
      \'c':           'gcc -Wall -Wextra -std=c99 -pedantic',
      \'c_plus':      './a.out',
      \'java':        'java',
      \'python':      'python',
      \'javascript':  'node',
      \'tsx':         'tsc --outFile %t %',
      \'tsx_plus':    'node %t',
      \'vim':         'source',  
      \}
let g:run_mapping = '<F5>'
let g:run_output_focus = 1
