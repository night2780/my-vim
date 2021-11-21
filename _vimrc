syntax on

 " Colorscheme 
set termguicolors
set background=light
colorscheme morning


set linespace=4
set tabstop=4                             
set shiftwidth=4                        
set smarttab                               
set expandtab
set smartindent
set autoindent                              
set cursorline                              
set showmatch                            
set encoding=utf-8
set backspace=2
set laststatus=2
set clipboard=unnamed
set nu
set splitbelow
set splitright
"set complete+=kspell
"set completeopt=menuone,longest
"set shortmess+=c
""set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2  " always display the status line

call plug#begin('~/vimfiles/plugged')
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'vimwiki/vimwiki'
Plug 'chriskempson/base16-vim'
Plug 'mangeshrex/uwu.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-syntastic/syntastic' 
Plug 'nvie/vim-flake8'
Plug 'terryma/vim-multiple-cursors'
" auto completion
Plug 'maralla/completor.vim'
Plug 'vim-scripts/AutoComplPop'
call plug#end()


if has("gui_running")
  if has("gui_gtk2")
    set guifont= Consolas:h12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h12
    set guioptions -=m "Hides the menubar
    set guioptions -=T "Hides the toolbar
  endif
endif
" completor
let g:completor_auto_trigger = 1
let g:syntastic_python_exec = 'python3' 
let python_highlight_all=1
let g:completor_eython_binary = 'C:\Users\DELL\AppData\Local\Programs\Python\Python39'
"multiline cursor"
"setting
" Default highlighting (see help :highlight and help :highlight-link)
highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual
let g:multi_cursor_support_imap = 1
let g:multi_cursor_exit_from_visual_mode = 1
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" Fugitive vim remaps
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>
imap <tab> <C-t> 
" editor to normal mode
imap <C-i> <esc> 
imap <A-j>  <esc> 
" bracket AutoComple
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap < <><Esc>ha
"leave the bracket"
inoremap <C-l> <esc>Ea
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"python complier
autocmd FileType  python map <buffer> <F9> :w<CR>:exec '!python %' <CR>
autocmd FileType  python imap <buffer> <F9> <esc>:w<CR>:exec '!python %'<CR>
autocmd Filetype  python nnoremap <buffer> <F6> <esc> :w <CR> :ter python "%"<CR>
autocmd FileType  python nnoremap <buffer> <F5> <esc>:w<CR>:vert ter python "%" <CR>
" Full screen 
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
"new line insert
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>
"insert cursor move"
inoremap <A-k> <Up>
inoremap <A-j> <Down>
inoremap <A-h> <left>
inoremap <A-l> <Right>
"Nerdtree
nnoremap <F3> :NERDTree
nnoremap <C-F3> :NERDTreeToggle <CR> 
nnoremap <M-F3> :NERDTreeFocus <CR> 
nnoremap <F3><A-q> :NERDTreeClose  <CR>
nnoremap <F5> :NERDTreeRefreshRoot  <CR>
nnoremap <F3><A-q> :NERDTreeClose  <CR>
nnoremap py :!python %<CR>
" move line up-down
nnoremap <C-Up> :m-2<CR>
nnoremap <C-Down> :m+<CR>
" resize buffer
nnoremap <C-F7> :vertical resize +5<CR>
map <F2> :ls <CR>
nmap <q><q> :exit <CR>
nmap <A-q> :close <CR>

