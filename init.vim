syntax on
:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set laststatus=2
:set splitbelow
:set splitright
:set showtabline=2
:set cursorline                              
:set showmatch 
set encoding=UTF-8

call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'jiangmiao/auto-pairs'
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'mangeshrex/uwu.vim' " uwu scheme
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/vim-airline/vim-airline-themes' " Status bar themes
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive' " git command
Plug 'https://github.com/jbgutierrez/vim-better-comments'

call plug#end()

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nmap <F8> :TagbarToggle<CR>

:set completeopt-=preview " For No Previews

:colorscheme onehalfdark
:set termguicolors

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
":CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

" better comments
let g:bettercomments_language_aliases = { 'python': 'py' }

" air-line
"let g:airline_themes='onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif

" Unicode symbols
"let g:airline_symbols.linenr = '␊'
""let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ' '
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ' 🖋 '
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' 🕮 :'
"let g:airline_symbols.linenr = ' :'
let g:airline_symbols.dirty='⚡'
let g:airline_symbols.maxlinenr = ' '
"let g:airline_section_z = airline#section#create(['🕮  '.'%{line('.'')}' .":". '%{col(".")}'])

" fzf Fuzzy files
nnoremap <C-p> :Files<Cr>

" Fugitive vim remaps
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

" move line up-down
nnoremap <A-k> :m-2<CR>
nnoremap <A-j> :m+<CR>

"insert cursor move"
inoremap <A-k> <Up>
inoremap <A-j> <Down>
inoremap <A-h> <left>
inoremap <A-l> <Right>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <buffer> <F6>:w <CR>:!python3 %<CR>
nnoremap <C-F6> :w <CR>:vert ter python3 %<CR>
inoremap <buffer> <C-F5> <esc> :w <CR>:!python3 %<CR>
nnoremap <F5> :w <CR>:!python3 %<CR>

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
