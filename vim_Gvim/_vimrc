syntax on

 " Colorscheme 
set termguicolors
set background=light
colorscheme base16-nord

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
scriptencoding utf-8
set backspace=2
set laststatus=2
set clipboard=unnamed
set nu
set splitbelow
set splitright
set shell=C:\\WINDOWS\\sysnative\\WindowsPowerShell\\v1.0\\powershell.exe
set shellcmdflag=-c
set shellpipe=>
set shellredir=>
"set showtabline=2
"set complete+=kspell
"set completeopt=menuone,longest
"set shortmess+=c
set laststatus=2  " always display the status line
call plug#begin('~/vimfiles/plugged')
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"line plugin
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'powerline/powerline'
Plug 'tpope/vim-surround'
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
    set guifont=Source_Code_Pro:h13
    "set guifont=Hack_Nerd_Font_Mono:h14
    "set guifont=mononoki_Nerd_Font_Mono:h13
    "set guifont=mononoki_Nerd_Font:h14
    set guioptions -=m "Hides the menubar
    set guioptions -=T "Hides the toolbar
  endif
endif
" lightline
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left':" ", 'right': " " },
      \ 'subseparator': { 'left': "\u2705", 'right': "\u2022" }
      \ }

"SwitchColor
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
" This is the default option:
"   - Preview window on the right with 50% width
"   - CTRL-/ will toggle preview window.
" - Note that this array is passed as arguments to fzf#vim#with_preview function.
" - To learn more about preview window options, see `--preview-window` section of `man fzf`.
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
" Preview window on the upper side of the window with 40% height,
" hidden by default, ctrl-/ to toggle
let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']
" Empty value to disable preview window altogether
let g:fzf_preview_window = []
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'
" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'
" completor
let g:python_highlight_all=1
let g:completor_auto_trigger=1
let g:syntastic_python_exec='python3' 
let python_highlight_all=1
let g:completor_eython_binary='C:\Users\DELL\AppData\Local\Programs\Python\Python39'
" syntastic"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_python_checkers = ['pylint']
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
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
autocmd FileType  python map <buffer> <F9> :w<CR>:exec'!python %'<CR>
autocmd FileType  python imap <buffer> <F9> <esc>:w<CR>:!python %<CR>
autocmd Filetype  python nnoremap <buffer> <F6> <esc> :w <CR>:ter python "%"<CR><A-q>
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
nnoremap <M-F3> :NERDTreeToggle<CR> 
nnoremap <C-F3> :NERDTreeFocus<CR> 
nnoremap <F3><A-q> :NERDTreeClose<CR>
nnoremap <C-F5> :NERDTreeRefreshRoot<CR>
nnoremap <S-F3> :NERDTreeFrombookmark<CR>
nnoremap py :!python %<CR>
" move line up-down
nnoremap <A-k> :m-2<CR>
nnoremap <A-j> :m+<CR>
"resize buffer
nnoremap <C-F7> :vertical resize +10<CR>
nnoremap <C-F6> :vertical resize -10<CR>

map <F2> :ls <CR>
nmap <q><q> :exit <CR>
nmap <A-q> :close <CR>

