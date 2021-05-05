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

" used to make things easier for filetype changes
" '<,'>s/hi! link \(\w*\)\sGruvbox\(\w*\)/call s:KatHiFun('\1', 'NONE', s:kat.\2[0], 'NONE', 'NONE',)
"'<,'>s/hi def link \(\w*\)\s\(\w*\)/call s:KatHiFun('\1', 'NONE', s:kat.\2[0], 'NONE', 'NONE',)

" swap and source function
" noremap <buffer> <leader>s :call SwapNSource()<CR>:source %<CR>
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

call s:KatHiFun('Question', 'NONE', s:kat.green[1], 'bold,underline', s:kat.green[1])
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
call s:KatHiFun('Comment', 'NONE', s:kat.blue[0], 'italic', 'NONE')

call s:KatHiFun('Constant', 'NONE', s:kat.pink[1], 'NONE', 'NONE')
call s:KatHiFun('String', 'NONE', s:kat.green[0], 'NONE', 'NONE')
call s:KatHiFun('Character', 'NONE', s:kat.green[1], 'bold', 'NONE')
call s:KatHiFun('Number', 'NONE', s:kat.purple[0], 'NONE', 'NONE')
call s:KatHiFun('Float', 'NONE', s:kat.purple[1], 'NONE', 'NONE')
call s:KatHiFun('Boolean', 'NONE', s:kat.blue[1], 'bold', 'NONE')

call s:KatHiFun('Identifier', 'NONE', s:kat.bg[5], 'NONE', 'NONE')
call s:KatHiFun('Function', 'NONE', s:kat.red[1], 'NONE', 'NONE')

call s:KatHiFun('Statement', 'NONE', s:kat.red[0], 'bold', 'NONE')
call s:KatHiFun('Conditional', 'NONE', s:kat.purple[0], 'NONE', 'NONE')
call s:KatHiFun('Repeat', 'NONE', s:kat.orange[0], 'NONE', 'NONE')
call s:KatHiFun('Label', 'NONE', s:kat.purple[1], 'bold', 'NONE')
call s:KatHiFun('Operator', 'NONE', s:kat.blue[0], 'bold', 'NONE')
call s:KatHiFun('Keyword', 'NONE', s:kat.green[0], 'bold,italic', 'NONE')
call s:KatHiFun('Exception', 'NONE', s:kat.fg[2], 'NONE', 'NONE')

call s:KatHiFun('PreProc', 'NONE', s:kat.pink[0], 'bold,italic', 'NONE')
call s:KatHiFun('Include', 'NONE', s:kat.pink[2], 'bold,italic', 'NONE')
call s:KatHiFun('Define', 'NONE', s:kat.purple[0], 'bold,italic', 'NONE')
call s:KatHiFun('Macro', 'NONE', s:kat.pink[1], 'bold,italic', 'NONE')
call s:KatHiFun('PreCondit', 'NONE', s:kat.fg[3], 'bold,italic', 'NONE')

call s:KatHiFun('Type', 'NONE', s:kat.orange[0], 'bold', 'NONE')
call s:KatHiFun('StorageClass', 'NONE', s:kat.blue[0], 'bold', 'NONE')
call s:KatHiFun('Structure', 'NONE', s:kat.blue[1], 'bold', 'NONE')
call s:KatHiFun('Typedef', 'NONE', s:kat.fg[5], 'bold', 'NONE')

call s:KatHiFun('Special', 'NONE', s:kat.pink[0], 'NONE', 'NONE')
call s:KatHiFun('SpecialChar', 'NONE', s:kat.pink[0], 'bold', 'NONE')
call s:KatHiFun('Tag', 'NONE', s:kat.red[1], 'bold', 'NONE')
call s:KatHiFun('Delimiter', 'NONE', s:kat.bg[3], 'bold', 'NONE')
call s:KatHiFun('SpecialComment', 'NONE', s:kat.bg[5], 'bold,italic', 'NONE')
call s:KatHiFun('Debug', 'NONE', s:kat.fg[3], 'bold,underline', s:kat.fg[3])

call s:KatHiFun('Underlined', 'NONE', s:kat.bg[5], 'underline', s:kat.bg[5])

call s:KatHiFun('Error', s:kat.red[0], s:kat.fg[1], 'bold', 'NONE')

call s:KatHiFun('Todo', s:kat.purple[0], s:kat.bg[0], 'NONE', 'NONE')

call s:KatHiFun('Ignore', 'NONE', s:kat.fg[4], 'NONE', 'NONE')

call s:KatHiFun('DiffDelete', s:kat.red[1], 'NONE', 'bold', 'NONE')
call s:KatHiFun('DiffAdd', s:kat.green[0], 'reverse', 'bold', 'NONE')
call s:KatHiFun('DiffChange', s:kat.purple[1], 'NONE', 'bold', 'NONE')
call s:KatHiFun('DiffText', s:kat.blue[0], 'NONE', 'bold', 'NONE')
" }}}

" Startify: {{{
call s:KatHiFun('StartifyBracket', 'NONE', s:kat.bg[3], 'bold', 'NONE',)
call s:KatHiFun('StartifyFile', 'NONE', s:kat.purple[0], 'NONE', 'NONE',)
call s:KatHiFun('StartifyNumber', 'NONE', s:kat.blue[0], 'bold', 'NONE',)
call s:KatHiFun('StartifyPath', 'NONE', s:kat.bg[5], 'NONE', 'NONE',)
call s:KatHiFun('StartifySlash', 'NONE', s:kat.fg[3], 'NONE', 'NONE',)
call s:KatHiFun('StartifySection', 'NONE', s:kat.red[1], 'bold', 'NONE',)
call s:KatHiFun('StartifySpecial', 'NONE', s:kat.bg[5], 'NONE', 'NONE',)
call s:KatHiFun('StartifyHeader', 'NONE', s:kat.pink[0], 'NONE', 'NONE',)
call s:KatHiFun('StartifyFooter', 'NONE', s:kat.bg[3], 'NONE', 'NONE',)
" }}}

" indentLine {{{
if !exists('g:indentLine_color_gui')
  let g:indentLine_color_gui = s:kat.fg[5]
endif
" }}}

" Coc.nvim {{{
call s:KatHiFun('CocErrorSign', 'NONE', s:kat.red[0], 'bold', 'NONE',)
call s:KatHiFun('CocWarningSign', 'NONE', s:kat.orange[0], 'bold', 'NONE',)
call s:KatHiFun('CocInfoSign', 'NONE', s:kat.orange[1], 'bold', 'NONE',)
call s:KatHiFun('CocHintSign', 'NONE', s:kat.blue[1], 'bold', 'NONE',)
call s:KatHiFun('CocErrorFloat', s:kat.bg[1], s:kat.red[0], 'NONE', 'NONE',)
call s:KatHiFun('CocWarningFloat', s:kat.bg[1], s:kat.orange[0], 'NONE', 'NONE',)
call s:KatHiFun('CocInfoFloat', s:kat.bg[1], s:kat.orange[1], 'NONE', 'NONE',)
call s:KatHiFun('CocHintFloat', s:kat.bg[1], s:kat.blue[1], 'NONE', 'NONE',)
call s:KatHiFun('CocDiagnosticsError', 'NONE', s:kat.red[0], 'NONE', 'NONE',)
call s:KatHiFun('CocDiagnosticsWarning', 'NONE', s:kat.orange[0], 'NONE', 'NONE',)
call s:KatHiFun('CocDiagnosticsInfo', 'NONE', s:kat.orange[1], 'NONE', 'NONE',)
call s:KatHiFun('CocDiagnosticsHint', 'NONE', s:kat.blue[0], 'NONE', 'NONE',)

call s:KatHiFun('CocSelectedText', s:kat.bg[1], s:kat.red[0], 'NONE', 'NONE',)
call s:KatHiFun('CocCodeLens', 'NONE', s:kat.fg[3], 'NONE', 'NONE',)

call s:KatHiFun('CocErrorHighlight', 'NONE', 'NONE', 'undercurl', s:kat.red[0])
call s:KatHiFun('CocWarningHighlight', 'NONE', 'NONE', 'undercurl', s:kat.orange[0])
call s:KatHiFun('CocInfoHighlight', 'NONE', 'NONE', 'undercurl', s:kat.orange[1])
call s:KatHiFun('CocHintHighlight', 'NONE', 'NONE', 'undercurl', s:kat.blue[1])
" }}}

" Filetype {{{

" Vim: {{{
call s:KatHiFun('vimCommentTitle', s:kat.fg[4], 'NONE', 'bold,italic', 'NONE')
call s:KatHiFun('vimNotation', 'NONE', s:kat.pink[1], 'NONE', 'NONE')
call s:KatHiFun('vimBracket', 'NONE', s:kat.pink[1], 'NONE', 'NONE')
call s:KatHiFun('vimMapModKey', 'NONE', s:kat.pink[1], 'NONE', 'NONE')
call s:KatHiFun('vimFuncSID', 'NONE', s:kat.fg[2], 'NONE', 'NONE')
call s:KatHiFun('vimSetSep', 'NONE', s:kat.fg[2], 'NONE', 'NONE')
call s:KatHiFun('vimSep', 'NONE', s:kat.fg[2], 'NONE', 'NONE')
call s:KatHiFun('vimContinue', 'NONE', s:kat.fg[2], 'NONE', 'NONE')
" }}}
" Vimwiki: {{{
call s:KatHiFun('VimwikiMarkers', 'NONE', s:kat.bg[4], 'NONE', 'NONE',)
call s:KatHiFun('VimwikiLink', 'NONE', s:kat.orange[0], 'underline,bold', s:kat.orange[0],)
call s:KatHiFun('VimwikiList', 'NONE', s:kat.blue[0], 'bold', 'NONE',)
call s:KatHiFun('VimwikiCheckBoxDone', 'NONE', s:kat.green[0], 'bold', 'NONE',)
call s:KatHiFun('VimwikiTag', 'NONE', s:kat.red[0], 'bold', 'NONE',)
call s:KatHiFun('VimwikiDelText', 'NONE', s:kat.pink[0], 'strikethrough', 'NONE',)
call s:KatHiFun('VimwikiCode', 'NONE', s:kat.blue[1], 'NONE', 'NONE',)
call s:KatHiFun('VimwikiHeader1', 'NONE', s:kat.blue[1], 'bold', 'NONE',)
call s:KatHiFun('VimwikiHeader2', 'NONE', s:kat.blue[0], 'bold', 'NONE',)
call s:KatHiFun('VimwikiHeader3', 'NONE', s:kat.orange[0], 'bold', 'NONE',)
call s:KatHiFun('VimwikiHeader4', 'NONE', s:kat.orange[1], 'bold', 'NONE',)
call s:KatHiFun('VimwikiHeader5', 'NONE', s:kat.pink[0], 'bold', 'NONE',)
call s:KatHiFun('VimwikiHeader6', 'NONE', s:kat.pink[1], 'bold', 'NONE',)
" }}}
" CSS: {{{
call s:KatHiFun('cssBraces', 'NONE', s:kat.fg[2], 'NONE', 'NONE',)
call s:KatHiFun('cssFunctionName', 'NONE', s:kat.purple[0], 'bold', 'NONE',)
call s:KatHiFun('cssIdentifier', 'NONE', s:kat.bg[5], 'NONE', 'NONE',)
call s:KatHiFun('cssClassName', 'NONE', s:kat.orange[2], 'bold', 'NONE',)
call s:KatHiFun('cssColor', 'NONE', s:kat.green[0], 'NONE', 'NONE',)
call s:KatHiFun('cssSelectorOp', 'NONE', s:kat.bg[4], 'NONE', 'NONE',)
call s:KatHiFun('cssSelectorOp2', 'NONE', s:kat.bg[4], 'NONE', 'NONE',)
call s:KatHiFun('cssImportant', 'NONE', s:kat.red[0], 'italic', 'NONE',)
call s:KatHiFun('cssVendor', 'NONE', s:kat.fg[4], 'NONE', 'NONE',)

call s:KatHiFun('cssTextProp', 'NONE', s:kat.green[0], 'bold', 'NONE',)
call s:KatHiFun('cssAnimationProp', 'NONE', s:kat.purple[1], 'bold', 'NONE',)
call s:KatHiFun('cssUIProp', 'NONE', s:kat.orange[1], 'bold', 'NONE',)
call s:KatHiFun('cssTransformProp', 'NONE', s:kat.bg[4], 'bold', 'NONE',)
call s:KatHiFun('cssTransitionProp', 'NONE', s:kat.bg[4], 'bold', 'NONE',)
call s:KatHiFun('cssPrintProp', 'NONE', s:kat.bg[4], 'bold', 'NONE',)
call s:KatHiFun('cssPositioningProp', 'NONE', s:kat.orange[0], 'bold', 'NONE',)
call s:KatHiFun('cssBoxProp', 'NONE', s:kat.bg[4], 'bold', 'NONE',)
call s:KatHiFun('cssFontDescriptorProp', 'NONE', s:kat.bg[4], 'bold', 'NONE',)
call s:KatHiFun('cssFlexibleBoxProp', 'NONE', s:kat.bg[4], 'bold', 'NONE',)
call s:KatHiFun('cssBorderOutlineProp', 'NONE', s:kat.bg[4], 'bold', 'NONE',)
call s:KatHiFun('cssBackgroundProp', 'NONE', s:kat.bg[4], 'bold', 'NONE',)
call s:KatHiFun('cssMarginProp', 'NONE', s:kat.bg[4], 'bold', 'NONE',)
call s:KatHiFun('cssListProp', 'NONE', s:kat.bg[4], 'bold', 'NONE',)
call s:KatHiFun('cssTableProp', 'NONE', s:kat.bg[4], 'bold', 'NONE',)
call s:KatHiFun('cssFontProp', 'NONE', s:kat.bg[4], 'bold', 'NONE',)
call s:KatHiFun('cssPaddingProp', 'NONE', s:kat.bg[4], 'bold', 'NONE',)
call s:KatHiFun('cssDimensionProp', 'NONE', s:kat.bg[4], 'bold', 'NONE',)
call s:KatHiFun('cssRenderProp', 'NONE', s:kat.bg[4], 'bold', 'NONE',)
call s:KatHiFun('cssColorProp', 'NONE', s:kat.bg[4], 'bold', 'NONE',)
call s:KatHiFun('cssGeneratedContentProp', 'NONE', s:kat.bg[4], 'bold', 'NONE',)
" }}}
" Markdown: {{{
call s:KatHiFun('markdownItalic', 'NONE', 'NONE', 'italic', 'NONE')
call s:KatHiFun('markdownBold', 'NONE', 'NONE', 'bold', 'NONE')
call s:KatHiFun('markdownBoldItalic', 'NONE', 'NONE', 'bold,italic', 'NONE')

call s:KatHiFun('markdownH1', 'NONE', s:kat.blue[1], 'bold', 'NONE',)
call s:KatHiFun('markdownH2', 'NONE', s:kat.blue[0], 'bold', 'NONE',)
call s:KatHiFun('markdownH3', 'NONE', s:kat.orange[0], 'bold', 'NONE',)
call s:KatHiFun('markdownH4', 'NONE', s:kat.orange[1], 'bold', 'NONE',)
call s:KatHiFun('markdownH5', 'NONE', s:kat.pink[0], 'bold', 'NONE',)
call s:KatHiFun('markdownH6', 'NONE', s:kat.pink[1], 'bold', 'NONE',)

call s:KatHiFun('markdownCode', s:kat.bg[1], s:kat.fg[3], 'NONE', 'NONE',)
call s:KatHiFun('markdownCodeBlock', 'NONE', s:kat.fg[3], 'NONE', 'NONE',)
call s:KatHiFun('markdownCodeDelimiter', 'NONE', s:kat.blue[1], 'NONE', 'NONE',)

call s:KatHiFun('markdownBlockquote', 'NONE', s:kat.bg[2], 'bold', 'NONE',)
call s:KatHiFun('markdownListMarker', 'NONE', s:kat.pink[0], 'bold', 'NONE',)
call s:KatHiFun('markdownOrderedListMarker', 'NONE', s:kat.pink[0], 'bold', 'NONE',)
call s:KatHiFun('markdownRule', 'NONE', s:kat.red[0], 'NONE', 'NONE',)
call s:KatHiFun('markdownHeadingRule', 'NONE', s:kat.red[0], 'NONE', 'NONE',)

call s:KatHiFun('markdownUrlDelimiter', 'NONE', s:kat.bg[3], 'NONE', 'NONE',)
call s:KatHiFun('markdownLinkDelimiter', 'NONE', s:kat.bg[3], 'NONE', 'NONE',)
call s:KatHiFun('markdownLinkTextDelimiter', 'NONE', s:kat.bg[3], 'NONE', 'NONE',)

call s:KatHiFun('markdownHeadingDelimiter', 'NONE', s:kat.orange[0], 'NONE', 'NONE',)
call s:KatHiFun('markdownUrl', 'NONE', s:kat.purple[0], 'NONE', 'NONE',)
call s:KatHiFun('markdownUrlTitleDelimiter', 'NONE', s:kat.green[0], 'NONE', 'NONE',)

call s:KatHiFun('markdownLinkText', 'NONE', s:kat.fg[2], 'underline', s:kat.fg[2])
call s:KatHiFun('markdownIdDeclaration', 'NONE', s:kat.fg[2], 'underline', s:kat.fg[2],)
" }}}
" XML: {{{
call s:KatHiFun('xmlTag', 'NONE', s:kat.red[0], 'bold', 'NONE',)
call s:KatHiFun('xmlEndTag', 'NONE', s:kat.blue[1], 'NONE', 'NONE',)
call s:KatHiFun('xmlTagName', 'NONE', s:kat.red[0], 'bold', 'NONE',)
call s:KatHiFun('xmlEqual', 'NONE', s:kat.bg[4], 'bold', 'NONE',)

call s:KatHiFun('xmlDocTypeDecl', 'NONE', s:kat.fg[3], 'NONE', 'NONE',)
call s:KatHiFun('xmlDocTypeKeyword', 'NONE', s:kat.purple[0], 'NONE', 'NONE',)
call s:KatHiFun('xmlCdataStart', 'NONE', s:kat.fg[3], 'NONE', 'NONE',)
call s:KatHiFun('xmlCdataCdata', 'NONE', s:kat.purple[0], 'NONE', 'NONE',)
call s:KatHiFun('dtdFunction', 'NONE', s:kat.fg[3], 'NONE', 'NONE',)
call s:KatHiFun('dtdTagName', 'NONE', s:kat.purple[0], 'NONE', 'NONE',)

call s:KatHiFun('xmlAttrib', 'NONE', s:kat.green[0], 'NONE', 'NONE',)
call s:KatHiFun('xmlProcessingDelim', 'NONE', s:kat.fg[3], 'NONE', 'NONE',)
call s:KatHiFun('dtdParamEntityPunct', 'NONE', s:kat.fg[3], 'NONE', 'NONE',)
call s:KatHiFun('dtdParamEntityDPunct', 'NONE', s:kat.fg[3], 'NONE', 'NONE',)
call s:KatHiFun('xmlAttribPunct', 'NONE', s:kat.fg[3], 'NONE', 'NONE',)

call s:KatHiFun('xmlEntity', 'NONE', s:kat.orange[0], 'bold', 'NONE',)
call s:KatHiFun('xmlEntityPunct', 'NONE', s:kat.red[0], 'bold', 'NONE',)
" }}}
" HTML: {{{
call s:KatHiFun('htmlBold', 'NONE', 'NONE', 'bold', 'NONE')
call s:KatHiFun('htmlBoldUnderline', 'NONE', 'NONE', 'bold,underline', 'NONE')
call s:KatHiFun('htmlBoldItalic', 'NONE', 'NONE', 'bold,italic', 'NONE')
call s:KatHiFun('htmlBoldUnderlineItalic', 'NONE', 'NONE', 'bold,underline,italic', 'NONE')

call s:KatHiFun('htmlUnderline', 'NONE', 'NONE', 'underline', 'NONE')
call s:KatHiFun('htmlUnderlineItalic', 'NONE', 'NONE', 'underline,italic', 'NONE')
call s:KatHiFun('htmlItalic', 'NONE', 'NONE', 'italic', 'NONE')
" }}}


" }}}


" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
