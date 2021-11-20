syntax on

 " Colorscheme 
set termguicolors
set background=light
colorscheme uwu

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
set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
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
" auto completion
Plug 'maralla/completor.vim'
"Plug 'vim-scripts/AutoComplPop'
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
" YouCompleteMe
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let g:ycm_python_binary_path='C:\:Users\DELL\AppData\Local\Programs\Python\Python39'

" " Fugitive vim remaps
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>
nmap <tab> :> <CR> 

" editor to normal mode
imap <C-i> <esc> 
imap <j><j> <esc> 
" bracket AutoComple
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap < <><Esc>ha
"leave the bracket"
inoremap <C-l> <esc> a
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

"Nerdtree
nnoremap <F3> :Ex <CR>
nnoremap <C-n> :NERDTree 
nnoremap <C-F2> :NERDTree  <CR>
nnoremap <C-t> :terminal<CR>
nnoremap py :!python %<CR>
" move line up-down
nnoremap <C-Up> :m-2<CR>
nnoremap <C-Down> :m+<CR>
" resize buffer
nnoremap <C-F7> :vertical resize +5<CR>
nnoremap <C-F8> :vertical resize -5<CR>
map <F2> :ls <CR>
nmap <q><q> :exit <CR>
nmap <A-q> :close <CR>

