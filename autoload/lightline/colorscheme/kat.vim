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

" }}}

let g:lightline = {
      \ 'colorscheme': 'kat'
      \ }

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

" Color options {{{
" Normal: {{{
let s:p.normal.left = [ [s:kat.bg[0], s:kat.purple[0], 11, 231, 'NONE' ], [s:kat.bg[0], s:kat.bg[5], 21, 231, 'NONE' ] ]
let s:p.normal.middle = [ [s:kat.bg[0], s:kat.pink[0], 11, 231, 'NONE' ] ]
let s:p.normal.right = [ [s:kat.bg[0], s:kat.purple[0], 11, 231, 'NONE' ], [s:kat.bg[0], s:kat.bg[5], 21, 231, 'NONE' ] ]
" }}}
" Inactive: {{{
let s:p.inactive.left = [ [s:kat.bg[0], s:kat.fg[3], 11, 231, 'NONE' ] ]
let s:p.inactive.middle = [ [s:kat.bg[0], s:kat.fg[3], 11, 231, 'NONE' ] ]
let s:p.inactive.right = [ [s:kat.bg[0], s:kat.fg[3], 11, 231, 'NONE' ] ]
" }}}
" Insert: {{{
let s:p.insert.left = [ [s:kat.bg[0], s:kat.blue[0], 11, 231, 'NONE' ], [s:kat.bg[0], s:kat.bg[5], 21, 231, 'NONE' ] ]
let s:p.insert.middle = [ [s:kat.bg[0], s:kat.blue[1], 11, 231, 'NONE' ] ]
let s:p.insert.right = [ [s:kat.bg[0], s:kat.blue[0], 11, 231, 'NONE' ], [s:kat.bg[0], s:kat.bg[5], 21, 231, 'NONE' ] ]
" }}}
" Replace: {{{
let s:p.replace.left = [ [s:kat.bg[0], s:kat.orange[0], 11, 231, 'NONE' ], [s:kat.bg[0], s:kat.bg[5], 21, 231, 'NONE' ] ]
let s:p.replace.middle = [ [s:kat.bg[0], s:kat.blue[1], 11, 231, 'NONE' ] ]
let s:p.replace.right = [ [s:kat.bg[0], s:kat.orange[0], 11, 231, 'NONE' ], [s:kat.bg[0], s:kat.bg[5], 21, 231, 'NONE' ] ]
" }}}
" Visual: {{{
let s:p.visual.left = [ [s:kat.bg[0], s:kat.red[0], 11, 231, 'NONE' ], [s:kat.bg[0], s:kat.bg[5], 21, 231, 'NONE' ] ]
let s:p.visual.middle = [ [s:kat.bg[0], s:kat.purple[0], 11, 231, 'NONE' ] ]
let s:p.visual.right = [ [s:kat.bg[0], s:kat.red[0], 11, 231, 'NONE' ], [s:kat.bg[0], s:kat.bg[5], 21, 231, 'NONE' ] ]
" }}}
" Tabline: {{{
let s:p.tabline.left = [ [s:kat.bg[0], s:kat.bg[5], 11, 231, 'NONE' ], [s:kat.bg[0], s:kat.purple[0], 21, 231, 'NONE' ] ]
let s:p.tabline.middle = [ [s:kat.bg[0], s:kat.bg[1], 11, 231, 'NONE' ] ]
let s:p.tabline.right = [ [s:kat.fg[0], s:kat.fg[5], 11, 231, 'NONE' ], [s:kat.bg[0], s:kat.purple[0], 21, 231, 'NONE' ] ]
let s:p.tabline.tabsel = [ [s:kat.bg[0], s:kat.purple[0], 11, 231, 'NONE' ] ]
" }}}
" }}}

let g:lightline#colorscheme#kat#palette = s:p

