syntax on

 " Colorscheme 
set termguicolors
set background=light
colorscheme base16-nord
"colorscheme papercolor
"colorscheme morning
"colorscheme base16-3024
"colorscheme base16-dracula
"base16-unikitty-light
"base16-gruvbox-dark-hard
"Fav colorscheme

"base16-ashes
"base16-atelier-cave
"base16-dune-light
"base16-atelier-dune
"base16-atelier-estuary
"base16-atelier-forest
"base16-atelier-heath
"base16-atelier-plateau-light
"base16-atelier-plateau
"base16-atelier-seaside
"base16-atelier-sulphurpool-light
"base16-atelier-sulphurpool
"base16-atlas
"base16-bespin
"base16-brewer
"base16-bright
"base16-brogrammer
"base16-brushtrees-dark
"base16-brushtrees
"base16-chalk
"base16-circus
"base16-classic-dark
"base16-classic-light
"base16-codeschool
"base16-cupertino
"base16-darktooth
"base16-default-dark
"base16-default-light
"base16-eighties
"base16-flat
"base16-fruit-soda
"base16-github
"base16-gruvbox-dark-pale
"base16-harmonic-dark
"base16-harmonic-light
"base16-heetch-light
"base16-heetch
"base16-helios
"base16-hopscotch
"base16-horizon-dark
"base16-ia-dark
"base16-irblack
"base16-isotope
"base16-macintosh
"base16-marrakesh
"base16-materia
"base16-material-darker
"base16-material-lighter
"base16-material-palenight
"base16-material-vivid
"base16-material
"base16-mexico-light
"base16-monokai
"base16-ocean
"base16-oceanicnext
"base16-one-light
"base16-onedark
"base16-outrun-dark
"base16-papercolor-dark
"base16-papercolor-light
"base16-paraiso
"base16-phd
"base16-pico
"base16-pop
"base16-porple
"base16-railscasts
"base16-rebecca
"base16-seti
"base16-shapeshifter
"base16-snazzy
"base16-solarflare
"base16-solarized-dark
"base16-solarized-light
"base16-spacemacs
"base16-summerfruit-dark
"base16-summerfruit-light
"base16-synth-midnight-dark
"base16-tomorrow-night-eighties
"base16-tomorrow-night
"base16-tomorrow
"base16-tube
"base16-twilight
"base16-unikitty-dark
"base16-woodland
"base16-xcode-dusk
"colorscheme base16-zenb

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
Plug 'jiangmiao/auto-pairs'
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
    "set guifont=Consolas:h12
    set guifont=Source_Code_Pro:h12
    set guioptions -=m "Hides the menubar
    set guioptions -=T "Hides the toolbar
  endif
endif
" SwitchColor
let loaded_switchcolor = 1
let paths = split(globpath(&runtimepath, 'colors/*.vim'), "\n")
let s:swcolors = map(paths, 'fnamemodify(v:val, ":t:r")')
let s:swskip = [ '256-jungle', '3dglasses', 'calmar256-light', 'coots-beauty-256', 'grb256' ]
let s:swback = 0    " background variants light/dark was not yet switched
let s:swindex = 0

function! SwitchColor(swinc)

	" if have switched background: dark/light
	if (s:swback == 1)
		let s:swback = 0
		let s:swindex += a:swinc
		let i = s:swindex % len(s:swcolors)

		" in skip list
		if (index(s:swskip, s:swcolors[i]) == -1)
			execute "colorscheme " . s:swcolors[i]
		else
			return SwitchColor(a:swinc)
		endif

	else
		let s:swback = 1
		if (&background == "light")
			execute "set background=dark"
		else
			execute "set background=light"
		endif

		" roll back if background is not supported
		if (!exists('g:colors_name'))
			return SwitchColor(a:swinc)
		endif
	endif

	" show current name on screen. :h :echo-redraw
	redraw
	execute "colorscheme"
endfunction

 map <F8>        :call SwitchColor(1)<CR>
imap <F8>   <Esc>:call SwitchColor(1)<CR>

 map <S-F8>      :call SwitchColor(-1)<CR>
imap <S-F8> <Esc>:call SwitchColor(-1)<CR>
" completor
let g:completor_auto_trigger = 1
let g:syntastic_python_exec = 'python3' 
let python_highlight_all=1
let g:completor_eython_binary = 'C:\Users\DELL\AppData\Local\Programs\Python\Python39'
" syntastic"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_python_checkers = ['pylint']
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
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
"Cycle Colorscheme"
nmap <F4>:call cyclecolor
" Fugitive vim remaps
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>
" editor to normal mode
imap <C-i> <esc> 
imap <A-j>  <esc> 

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
nnoremap <C-k> :m-2<CR>
nnoremap <C-j> :m+<CR>
" resize buffer
nnoremap <C-F7> :vertical resize +10<CR>
nnoremap <C-F6> :vertical resize -10<CR>

map <F2> :ls <CR>
nmap <q><q> :exit <CR>
nmap <A-q> :close <CR>

