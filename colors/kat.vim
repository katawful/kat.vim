highlight clear
if exists("syntax_on")
  syntax reset
endif

set termguicolors

let g:colors_name='kat'

" color scheme type
if !exists('g:kat_theme')
  let g:kat_theme = 'dark'
endif

" set general shade option
if g:kat_theme ==? 'dark'
  set background=dark
elseif g:kat_theme ==? 'light'
  set background=light
else
  echoerr "'g:kat_theme' is invalid, defaulting to 'dark'"
endif

" define color dictionary {{{
let s:kat = {}

" fill with dark colors {{{
if g:kat_theme ==? 'dark'
  let s:kat.fg = '#daf6ff'
  let s:kat.fg1 = '#b5d5df'
  let s:kat.fg2 = '#8dbcca'
  let s:kat.fg3 = '#699faf'
  let s:kat.fg4 = '#4f7e8c'
  let s:kat.fg5 = '#325049'

  let s:kat.bg = '#121c2d'
  let s:kat.bg1 = '#1c2e4a'
  let s:kat.bg2 = '#2c466e'
  let s:kat.bg3 = '#46689c'
  let s:kat.bg4 = '#6690d0'
  let s:kat.bg5 = '#78adff'

  let s:kat.red_norm = '#eb4949'
  let s:kat.green_norm = '#8ceba9'
  let s:kat.orange_norm = '#f2b15c'
  let s:kat.pink_norm = '#f29cb1'
  let s:kat.purple_norm = '#c8a5f1'
  let s:kat.blue_norm = '#7bb7c9'

  let s:kat.red_contrast = '#ff5a5a'
  let s:kat.green_contrast = '#9dffd2'
  let s:kat.orange_contrast = 'ffe861'
  let s:kat.pink_contrast = '#ffaed5'
  let s:kat.purple_contrast = '#f9b5ff'
  let s:kat.blue_contrast = '#8af9ff'
endif
" }}}

" fill with light colors {{{
if g:kat_theme ==? 'light'
  let s:kat.fg = '#121c2d'
  let s:kat.fg1 = '#1c2e4a'
  let s:kat.fg2 = '#2c466e'
  let s:kat.fg3 = '#46689c'
  let s:kat.fg4 = '#6690d0'
  let s:kat.fg5 = '#78adff'

  let s:kat.bg = '#daf6ff'
  let s:kat.bg1 = '#b5d5df'
  let s:kat.bg2 = '#8dbcca'
  let s:kat.bg3 = '#699faf'
  let s:kat.bg4 = '#4f7e8c'
  let s:kat.bg5 = '#325049'

  let s:kat.red_norm = '#eb4949'
  let s:kat.green_norm = '#8ceba9'
  let s:kat.orange_norm = '#f2b15c'
  let s:kat.pink_norm = '#f29cb1'
  let s:kat.purple_norm = '#c8a5f1'
  let s:kat.blue_norm = '#7bb7c9'

  let s:kat.red_contrast = '#ff5a5a'
  let s:kat.green_contrast = '#9dffd2'
  let s:kat.orange_contrast = 'ffe861'
  let s:kat.pink_contrast = '#ffaed5'
  let s:kat.purple_contrast = '#f9b5ff'
  let s:kat.blue_contrast = '#8af9ff'
endif
" }}}

" }}}

" highlight function {{{
function! s:KatHiFun(group, ...)
  " arguments: group, bg, fg, gui, guisp
  let histring = 'hi ' . a:group . ' '

  if strlen(a:1)
    let histring .= 'guibg=' . a:1 . ' '
  endif
 
  if strlen(a:2)
    let histring .= 'guifg=' . a:2 . ' '
  endif

  if strlen(a:3)
    let histring .= 'gui=' . a:3 . ' '
  endif

  if strlen(a:4)
    let histring .= 'guisp=' . a:4 . ' '
  endif

  execute histring
endfunction
" }}}

" Vim groups {{{
call s:KatHiFun('Normal', s:kat.bg, s:kat.fg, 'NONE', 'NONE')
call s:KatHiFun('NonText', s:kat.bg, s:kat.fg, 'NONE', 'NONE')
call s:KatHiFun('Comment', s:kat.bg, s:kat.blue_contrast, 'italic', 'NONE')
call s:KatHiFun('Cursor', s:kat.fg1, s:kat.fg1, 'NONE', 'NONE')
" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
