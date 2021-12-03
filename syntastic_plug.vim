call plug#begin()

Plug 'vim-syntastic/syntastic' " syntax checker

call plug#end()

" syntastic"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_highlighting = 1
let g:syntastic_stl_format = "[%E{Err: %fe #%e}]"
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_quiet_messages = { "level": "warnings" }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
