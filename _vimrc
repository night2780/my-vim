syntax on

 " Colorscheme 
"colorscheme elford
"colorscheme base16-one-light
"colorscheme base16-one-dark
"colorscheme uwu
colorscheme base16-flat
"colorscheme base16-dracula
"colorscheme base16-github
"colorscheme base16-summerfruit-light 
"colorscheme base16-summerfruit-dark
"colorscheme nuvola


set tabstop=4                               " 4 whitespaces for tabs visual presentation
set shiftwidth=4                            " shift lines by 4 spaces
set smarttab                                " set tabs for a shifttabs logic
set expandtab
" expand tabs into spaces
set smartindent
set autoindent                              " indent when moving to the next line while writing code
set cursorline                              " shows line under the cursor's line
set showmatch                               " shows matching part of bracket pairs (), [], {}

set enc=utf-8

set backspace=2
set laststatus=2
set clipboard=unnamed
set nu
set termguicolors "base16-dracula"
call plug#begin('~/vimfiles/plugged')
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'vimwiki/vimwiki'
Plug 'chriskempson/base16-vim'
Plug 'mangeshrex/uwu.vim'
Plug 'vim-syntastic/syntastic' 
Plug 'nvie/vim-flake8'
Plug 'maralla/completor.vim'

call plug#end()


if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h12:cANSI
    set guioptions -=m "Hides the menubar
    set guioptions -=T "Hides the toolbar
  endif
endif
let python_highlight_all=1
let g:completor_python_binary = '/path/to/python/with/jedi/installed'

"** jedi path  c:\users\dell\appdata\local\programs\python\python39\lib\


" " Fugitive vim remaps
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd Filetype python nnoremap <buffer> <F6> <esc> :w <CR> :ter python3 "%"<CR>

autocmd FileType python nnoremap <buffer> <F5> <esc>:w<CR>:vert ter python3 "%" <CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :terminal<CR>
nnoremap py :!python %
map <F2> :ls<CR>:e
nmap <F4> :exit <CR>