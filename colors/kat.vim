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

" swap and source function
" nnoremap <buffer> <leader>s :call SwapNSource()<CR>:source %<CR>
" map for it
function! SwapNSource()
  if g:kat_theme ==? 'light'
    let g:kat_theme = 'dark'
  elseif g:kat_theme ==? 'dark'
    let g:kat_theme = 'light'
  endif
endfunction

" define color dictionary {{{
let s:kat = {}

" fill with dark colors {{{
if g:kat_theme ==? 'dark'
  let s:kat.fg = ['#daf6ff',
        \'#b5d5df',
        \'#8dbcca',
        \'#699faf',
        \'#4f7e8c',
        \'#325049'
        \]

  let s:kat.bg = ['#121c2d',
        \'#1c2e4a',
        \'#2c466e',
        \'#46689c',
        \'#6690d0',
        \'#78adff',
        \]

  " order: normal, contrast, dull
  let s:kat.red = ['#eb4949', '#ff5a5a', '#9c3636']
  let s:kat.green = ['#8ceba9', '#9dffd2', '#60b77a']
  let s:kat.orange = ['#f2b15c', '#ffe861', '#ce8b33']
  let s:kat.pink = ['#f29cb1', '#ffaed5', '#a73953']
  let s:kat.purple = ['#c8a5f1', '#f9b5ff', '#7a53a8']
  let s:kat.blue = ['#7bb7c9', '#8af9ff', '#388ba4']
endif
" }}}

" fill with light colors {{{
if g:kat_theme ==? 'light'
  let s:kat.fg = ['#121c2d',
        \'#1c2e4a',
        \'#2c466e',
        \'#46689c',
        \'#6690d0',
        \'#78adff',
        \]

  let s:kat.bg = ['#daf6ff',
        \'#b5d5df',
        \'#8dbcca',
        \'#699faf',
        \'#4f7e8c',
        \'#325049'
        \]

  " order: normal, contrast, dull
  let s:kat.red = ['#eb4949', '#9c3636', '#ff5a5a']
  let s:kat.green = ['#8ceba9', '#60b77a', '#9dffd2']
  let s:kat.orange = ['#f2b15c', '#ce8b33', '#ffe861']
  let s:kat.pink = ['#f29cb1', '#a73953', '#ffaed5']
  let s:kat.purple = ['#c8a5f1', '#7a53a8', '#f9b5ff']
  let s:kat.blue = ['#7bb7c9', '#388ba4', '#8af9ff']
endif
" }}}

" 16 color version {{{
let s:kat.16 = {}
let s:kat.16[0] = s:kat.bg[0]
let s:kat.16[1] = s:kat.red[0]
let s:kat.16[2] = s:kat.green[0]
let s:kat.16[3] = s:kat.orange[0]
let s:kat.16[4] = s:kat.pink[0]
let s:kat.16[5] = s:kat.purple[0]
let s:kat.16[6] = s:kat.blue[0]
let s:kat.16[7] = s:kat.fg[0]
let s:kat.16[8] = s:kat.bg[1]
let s:kat.16[9] = s:kat.red[1]
let s:kat.16[10] = s:kat.green[1]
let s:kat.16[11] = s:kat.orange[1]
let s:kat.16[12] = s:kat.pink[1]
let s:kat.16[13] = s:kat.purple[1]
let s:kat.16[14] = s:kat.blue[1]
let s:kat.16[15] = s:kat.fg[1]
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
call s:KatHiFun('Normal', s:kat.bg[0], s:kat.fg[0], 'NONE', 'NONE')
call s:KatHiFun('NormalNC', s:kat.bg[0], s:kat.fg[0], 'NONE', 'NONE')
call s:KatHiFun('NormalFLoat', s:kat.bg[0], s:kat.fg[0], 'NONE', 'NONE')
call s:KatHiFun('NonText', s:kat.bg[0], s:kat.fg[3], 'NONE', 'NONE')
call s:KatHiFun('MatchPattern', s:kat.red[1], s:kat.fg[0], 'NONE', 'NONE')
call s:KatHiFun('SpecialKey', 'NONE', s:kat.fg[2], 'NONE', 'NONE')
call s:KatHiFun('Whitespace', 'NONE', s:kat.fg[5], 'NONE', 'NONE')

" TODO some terminals don't support undercurl properly, this needs to be adjusted
call s:KatHiFun('SpellBad', 'NONE', 'NONE', 'undercurl', s:kat.red[0])
call s:KatHiFun('SpellCap', 'NONE', 'NONE', 'undercurl', s:kat.blue[0])
call s:KatHiFun('SpellLocal', 'NONE', 'NONE', 'undercurl', s:kat.green[0])
call s:KatHiFun('SpellRare', 'NONE', 'NONE', 'undercurl', s:kat.pink[0])

call s:KatHiFun('StatusLine', s:kat.purple[1], s:kat.bg[0], 'NONE', 'NONE')
call s:KatHiFun('StatusLineNC', s:kat.purple[2], s:kat.bg[0], 'NONE', 'NONE')

call s:KatHiFun('TabLine', s:kat.purple[0], s:kat.bg[0], 'NONE', 'NONE')
call s:KatHiFun('TabLineFill', s:kat.purple[2], s:kat.bg[0], 'NONE', 'NONE')
call s:KatHiFun('TabLineSel', s:kat.blue[1], s:kat.bg[0], 'bold', 'NONE')

call s:KatHiFun('Title', 'NONE', s:kat.green[1], 'NONE', 'NONE')

call s:KatHiFun('Visual', s:kat.bg[4], 'NONE', 'NONE', 'NONE')
call s:KatHiFun('Visual', s:kat.red[1], 'NONE', 'NONE', 'NONE')

call s:KatHiFun('Pmenu', s:kat.pink[2], s:kat.fg[0], 'NONE', 'NONE')
call s:KatHiFun('PmenuSel', s:kat.pink[1], s:kat.bg[0], 'NONE', 'NONE')
call s:KatHiFun('PmenuSbar', s:kat.fg[1], s:kat.fg[0], 'NONE', 'NONE')
call s:KatHiFun('PmenuThumb', s:kat.bg[3], s:kat.bg[0], 'NONE', 'NONE')
call s:KatHiFun('WildMenu', s:kat.pink[1], s:kat.bg[0], 'NONE', 'NONE')

call s:KatHiFun('Question', 'NONE', s:kat.green[1], 'bold,underline', 'NONE')
call s:KatHiFun('QuickFixLine', s:kat.bg[1], 'NONE', 'NONE', 'NONE')

call s:KatHiFun('Cursor', s:kat.fg[0], s:kat.bg[0], 'NONE', 'NONE')
call s:KatHiFun('CursorColumn', s:kat.bg[2], 'NONE', 'NONE', 'NONE')
call s:KatHiFun('CursorLine', s:kat.bg[2], 'NONE', 'NONE', 'NONE')
call s:KatHiFun('ColorColumn', s:kat.bg[3], 'NONE', 'bold', 'NONE')

call s:KatHiFun('ErrorMsg', s:kat.red[0], s:kat.fg[0], 'NONE', 'NONE')
call s:KatHiFun('WarningMsg', s:kat.bg[0], s:kat.red[0], 'bold', 'NONE')

call s:KatHiFun('VertSplit', s:kat.bg[1], s:kat.fg[3], 'NONE', 'NONE')
call s:KatHiFun('Folded', 'NONE', s:kat.fg[2], 'bold', 'NONE')
call s:KatHiFun('FoldColumn', 'NONE', s:kat.purple[1], 'bold', 'NONE')
call s:KatHiFun('SignColumn', 'NONE', 'NONE', 'bold', 'NONE')

call s:KatHiFun('IncSearch', s:kat.orange[1], s:kat.bg[0], 'NONE', 'NONE')
call s:KatHiFun('Substitute', s:kat.orange[1], s:kat.bg[0], 'NONE', 'NONE')
call s:KatHiFun('Search', s:kat.orange[0], s:kat.bg[0], 'NONE', 'NONE')

call s:KatHiFun('LineNr', 'NONE', s:kat.pink[0], 'NONE', 'NONE')
" TODO add underline option?
call s:KatHiFun('CursorLineNr', 'NONE', s:kat.pink[1], 'bold', 'NONE')

call s:KatHiFun('ModeMsg', s:kat.bg[2], s:kat.fg[0], 'bold', 'NONE')
call s:KatHiFun('MsgArea', s:kat.bg[1], s:kat.fg[0], 'NONE', 'NONE')
call s:KatHiFun('MsgSeparator', s:kat.bg[1], s:kat.fg[0], 'NONE', 'NONE')
call s:KatHiFun('MoreMsg', 'NONE', s:kat.purple[1], 'NONE', 'NONE')

" gui specific stuff
if has("gui")
  call s:KatHiFun('Menu', s:kat.bg[0], s:kat.fg[0], 'NONE', 'NONE')
  call s:KatHiFun('Scrollbar', s:kat.pink[0], s:kat.fg[0], 'NONE', 'NONE')
  call s:KatHiFun('Scrollbar', s:kat.bg[1], s:kat.fg[0], 'NONE', 'NONE')
endif

" }}}

" Vim syntax groups {{{
" TODO italics option
call s:KatHiFun('Comment', s:kat.bg[0], s:kat.blue[1], 'italic', 'NONE')
" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
