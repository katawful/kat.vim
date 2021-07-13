![image](https://raw.githubusercontent.com/katawful/RandomAssets/main/colors.png)

# kat.vim
A Vim theme with warm blue tones.
Currently designed for dark mode, light mode is usable but currently has contrast issues.
This theme only works with `termguicolors` support.

# NeoVim Feature Support
A port to NeoVim's Lua syntax will happen when the necessary Lua constructs are available.
Until then, you will simply have to make do with how NeoVim maps certain syntax groups by default.

# Installation:
Install with your plugin manager of choice.
Example for vim-plug:
```vim
" kat.vim
Plug 'katawful/kat.vim'
```

# Examples
![2021-05-01~12:11:52](https://user-images.githubusercontent.com/45222045/116788285-b8e7e480-aa76-11eb-95c7-59b6845acda2.png)
![2021-05-01~12:13:38](https://user-images.githubusercontent.com/45222045/116788301-d3ba5900-aa76-11eb-9269-149bb3bb393c.png)

![2021-05-01~12:12:25](https://user-images.githubusercontent.com/45222045/116788320-ef256400-aa76-11eb-8a7f-21ec2bec8422.png)
![2021-05-01~12:13:07](https://user-images.githubusercontent.com/45222045/116788325-f482ae80-aa76-11eb-84d3-09deadddc145.png)



# Options
Only 1 option is available: `g:kat_theme`.
This changes the general theme between light and dark

| Variable | Options | Default|
|---|---|---|
|`g:kat_theme` | `'dark'`, `'light'` | `'dark'`

# Currently supported plugin colorations
| Plugin|
|---|
|[coc.nvim](https://github.com/neoclide/coc.nvim)|
|[Vimwiki](https://github.com/vimwiki/vimwiki)|
|[indentLine](https://github.com/Yggdroot/indentLine)|
|[Airline](https://github.com/vim-airline/vim-airline)|
|[lightline](https://github.com/itchyny/lightline.vim)|

# Currently supported filetype colorations
|Filetypes|
|---|
|Vimscript|
|XML|
|HTML|
|Markdown|
|CSS|

# Contributing
If you want a plugin or filetype addition, feel free to make an issue
