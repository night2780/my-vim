
" Change the color scheme from a list of color scheme names.
" Version 2010-09-12 from http://vim.wikia.com/wiki/VimTip341
" Press key:
"   F8                next scheme
"   Shift-F8          previous scheme
"   Alt-F8            random scheme
" Set the list of color schemes used by the above (default is 'all'):
"   :SetColors all              (all $VIMRUNTIME/colors/*.vim)
"   :SetColors my               (names built into script)
"   :SetColors blue slate ron   (these schemes)
"   :SetColors                  (display current scheme names)
" Set the current color scheme based on time of day:
"   :SetColors now
if v:version < 700 || exists('loaded_setcolors') || &cp
  finish
endif

let loaded_setcolors = 1
let s:mycolors = ['slate', 'torte', 'darkblue', 'delek', 'murphy', 'elflord', 'pablo', 'koehler', 'base16-gruvbox-dark-hard', 'base16-atelier-dune-light']  " colorscheme names that we use to set color
"base16-3024.se16-apathy
"base16-ashes.vim
"base16-atelier-cave-light
"base16-atelier-cave
"base16-atelier-dune-light
"base16-atelier-dune
"base16-aer-estuary-light
"base16-atelier-estuary
"base16-atelier-forest-light
"base16-atelier-forest
"base16-atelier-heath-light
"base16-atelier-heath
"base16-atelier-lakeside-light
"base16-atelier-lakeside
"base16-atelier-plateau-light
"base16-atelier-plateau
"base16-atelier-savanna-light
"base16-atelier-savanna
"base16-atelier-seaside-light
"base16-atelier-seaside
"base16-atelier-sulphurpool-light
"base16-atelier-sulphurpool
"base16-atlas
"base16-bespin
"base16-black-metal-bathory
"base16-black-metal-burzum
"base16-black-metal-dark-funeral
"base16-black-metal-gorgoroth
"base16-black-metal-immortal
"base16-black-metal-khold
"base16-black-metal-marduk
"base16-black-metal-mayhem
"base16-black-metal-nile
"base16-black-metal-venom
"base16-black-metal
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
"base16-cupcake
"base16-cupertino
"base16-darktooth
"base16-default-dark
"base16-default-light
"base16-dracula
"base16-eighties
"base16-embers
"base16-flat
"base16-fruit-soda
"base16-github
"base16-google-dark
"base16-google-light
"base16-grayscale-dark
"base16-grayscale-light
"base16-greenscreen
"base16-gruvbox-dark-hard
"base16-gruvbox-dark-medium
"base16-gruvbox-dark-pale
"base16-gruvbox-dark-soft
"base16-gruvbox-light-hard
"base16-gruvbox-light-medium
"base16-gruvbox-light-soft
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
"base16-mellow-purple
"base16-mexico-light
"base16-mocha
"base16-monokai
"base16-nord
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
"base16-unikitty-light
"base16-woodland
"base16-xcode-dusk
"base16-zenb


" Set list of color scheme names that we will use, except
" argument 'now' actually changes the current color scheme.
function! s:SetColors(args)
  if len(a:args) == 0
    echo 'Current color scheme names:'
    let i = 0
    while i < len(s:mycolors)
      echo '  '.join(map(s:mycolors[i : i+4], 'printf("%-14s", v:val)'))
      let i += 5
    endwhile
  elseif a:args == 'all'
    let paths = split(globpath(&runtimepath, 'colors/*.vim'), "\n")
    let s:mycolors = uniq(sort(map(paths, 'fnamemodify(v:val, ":t:r")')))
    echo 'List of colors set from all installed color schemes'
  elseif a:args == 'my'
    let c1 = 'default elflord peachpuff desert256 breeze morning'
    let c2 = 'darkblue gothic aqua earth black_angus relaxedgreen'
    let c3 = 'darkblack freya motus impact less chocolateliquor'
    let s:mycolors = split(c1.' '.c2.' '.c3)
    echo 'List of colors set from built-in names'
  elseif a:args == 'now'
    call s:HourColor()
  else
    let s:mycolors = split(a:args)
    echo 'List of colors set from argument (space-separated names)'
  endif
endfunction

command! -nargs=* SetColors call s:SetColors('<args>')

" Set next/previous/random (how = 1/-1/0) color from our list of colors.
" The 'random' index is actually set from the current time in seconds.
" Global (no 's:') so can easily call from command line.
function! NextColor(how)
  call s:NextColor(a:how, 1)
endfunction

" Helper function for NextColor(), allows echoing of the color name to be
" disabled.
function! s:NextColor(how, echo_color)
  if len(s:mycolors) == 0
    call s:SetColors('all')
  endif
  if exists('g:colors_name')
    let current = index(s:mycolors, g:colors_name)
  else
    let current = -1
  endif
  let missing = []
  let how = a:how
  for i in range(len(s:mycolors))
    if how == 0
      let current = localtime() % len(s:mycolors)
      let how = 1  " in case random color does not exist
    else
      let current += how
      if !(0 <= current && current < len(s:mycolors))
        let current = (how>0 ? 0 : len(s:mycolors)-1)
      endif
    endif
    try
      execute 'colorscheme '.s:mycolors[current]
      break
    catch /E185:/
      call add(missing, s:mycolors[current])
    endtry
  endfor
  redraw
  if len(missing) > 0
    echo 'Error: colorscheme not found:' join(missing)
  endif
  if (a:echo_color)
    echo g:colors_name
  endif
endfunction

nnoremap <F8> :call NextColor(1)<CR>
nnoremap <S-F8> :call NextColor(-1)<CR>
nnoremap <A-F8> :call NextColor(0)<CR>

" Set color scheme according to current time of day.
function! s:HourColor()
  let hr = str2nr(strftime('%H'))
  if hr <= 3
    let i = 0
  elseif hr <= 7
    let i = 1
  elseif hr <= 14
    let i = 2
  elseif hr <= 18
    let i = 3
  else
    let i = 4
  endif
  let nowcolors = 'elflord morning desert evening pablo'
  execute 'colorscheme '.split(nowcolors)[i]
  redraw
  echo g:colors_name
endfunction
