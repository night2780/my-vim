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
:set encoding=UTF-8


call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'jiangmiao/auto-pairs'
Plug 'https://github.com/preservim/nerdtree' " NerdTree
"Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
"Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'mangeshrex/uwu.vim' " uwu scheme
Plug 'https://github.com/morhetz/gruvbox' "Gruvbox scheme
Plug 'https://github.com/vim-python/python-syntax' "python syntax hilighting
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive' " git command
Plug 'https://github.com/jbgutierrez/vim-better-comments'
Plug 'mhinz/vim-startify' "neovim start page
Plug 'leafoftree/vim-run' " vimrun code

call plug#end()

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nmap <F8> :TagbarToggle<CR>

:set completeopt-=preview " For No Previews
:set completeopt=longest,menuone

:colorscheme gruvbox
let g:gruvbox_contrast_dark = ('hard')
:set termguicolors
:set background=dark

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
":CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

" air-line
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif

" syntax hilighting
let g:python_highlight_all = 1

" better comments
let g:bettercomments_language_aliases = { 'python': 'py' }

"one line comments
nnoremap <A-/> I# <esc>
" multilline comments
vmap <F2> <C-n> I# <esc>

" fzf Fuzzy files
nnoremap <C-p> :Files<Cr>
nnoremap <C-b> :Buffers<Cr>

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

nnoremap <C-F2> :CocCommand workspace.renameCurrentFile<CR> 
nnoremap <F9> :CocCommand python.execInTerminal<CR> <C-j>
nnoremap <F6> :w <CR>:!python3 %<CR>

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
