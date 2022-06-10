# Install and config NeoVim for Flutter develoment
- [Install XCODE](#install_xcode)
- [Install Android Studio](#install_android_studio)
- [Install iterm2](!install_iterm2)

## Install XCODE
You can install xcode from AppStore

## Install Android Studio
You can download and install Android studio from `https://developer.android.com`

## Install iTerm2
You can download and install iTerm2 from `https://iterm2.com/`

My iTerm2 profile setup:
```cmd
Appearance: 
    Windows: 
        Hide scrollbars
Profiles:
    Default:
        General:
            Working Directory:
                <Set to your working dir>
        Colors:
            Color Presets:
                Solarized Dark
        Text
            Text Rendering:
                Blinking text
            Font:
                Hack Nerd Font
                Size: 20
        Window:
            Window Appearance:
                Transparency:
                    5
                Blur:
                    5
                Style:
                    No Title Bar
```

## Install HomeBrew
To install HomeBrew use this command:
```cmd
ruby -e "$(curl -fsSL https://githubusercontent.com/Homebrew/install/master/install)"
```

## Install NeoVim
To install neovim user this command:
```cmd
brew install neovim
```

## Install vim-plug
More info on vim-plug can be found here `https://github.com/junegunn/vim-plug`

To install vim-plug for Neovim execute this command:
```cmd
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

## Create init.vim file
We will create an init.vim file on `~/.config/nvim` location.
My final init.vim file will look like this:
```vim
" Fundamentals "{{{
" ---------------------------------------------------------------------

" init autocmd
autocmd!
" set script encoding
scriptencoding utf-8
" stop loading config if it's on tiny or small
if !1 | finish | endif

set nocompatible
set number
syntax enable
set fileencodings=utf-8,sjis,euc-jp,latin
set encoding=utf-8
set title
set autoindent
set background=dark
set nobackup
set hlsearch
set showcmd
set cmdheight=1
set laststatus=2
set scrolloff=10
set expandtab
"let loaded_matchparen = 1
set shell=fish
set backupskip=/tmp/*,/private/tmp/*

" incremental substitution (neovim)
if has('nvim')
  set inccommand=split
endif

" Suppress appending <PasteStart> and <PasteEnd> when pasting
set t_BE=

set nosc noru nosm
" Don't redraw while executing macros (good performance config)
set lazyredraw
"set showmatch
" How many tenths of a second to blink when matching brackets
"set mat=2
" Ignore case when searching
set ignorecase
" Be smart when using tabs ;)
set smarttab
" indents
filetype plugin indent on
filetype indent on
set shiftwidth=2
set tabstop=2
set ai "Auto indent
set si "Smart indent
set nowrap "No Wrap lines
set backspace=start,eol,indent
" Finding files - Search down into subfolders
set path+=**
set wildignore+=*/node_modules/*

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" Add asterisks in block comments
set formatoptions+=r


"}}}


" Highlights "{{{
" ---------------------------------------------------------------------
set cursorline
"set cursorcolumn

" Set cursor line color on visual mode
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40

highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

if &term =~ "screen"
  autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
  autocmd VimLeave * silent!  exe '!echo -n "\ek[`hostname`:`basename $PWD`]\e\\"'
endif

"}}}


" File types "{{{
" ---------------------------------------------------------------------
" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescriptreact
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.mdx set filetype=markdown
" Flow
au BufNewFile,BufRead *.flow set filetype=javascript
" Fish
au BufNewFile,BufRead *.fish set filetype=fish

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

"}}}


" Imports "{{{
" ---------------------------------------------------------------------
runtime ./plug.vim
runtime ./maps.vim
"}}}


" Syntax theme "{{{
" ---------------------------------------------------------------------

" true color
if exists("&termguicolors") && exists("&winblend")
  syntax enable
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
  set background=dark
  " Use NeoSolarized
  let g:neosolarized_termtrans=1
  runtime ./colors/NeoSolarized.vim
  colorscheme NeoSolarized
endif

"}}}

" Extras "{{{
" ---------------------------------------------------------------------
set exrc
"}}}
```
## Config plugin
We will create a plug.vim to load and install neovim plugin.
This file will locat in `~/.config/nvim/`. My final plug.vim file will look like this:
```vim
call plug#begin()

if has("nvim")
  Plug 'neoclide/coc.nvim', {'branch': 'release'}	
  Plug 'windwp/nvim-autopairs'
  Plug 'dart-lang/dart-vim-plugin'
  Plug 'Shougo/defx.nvim', {'do': ':UpdateRemotePlugins'}
  Plug 'kristijanhusak/defx-git'
  Plug 'kristijanhusak/defx-icons'
  Plug 'hoob3rt/lualine.nvim'
  Plug 'nvim-telescope/telescope.nvim'
endif	

call plug#end()
```
## Install Flutter SDK
To install flutter SDK we will excute this command:
```cmd
brew install flutter
```
After that you can run:
```cmd
flutter doctor
```
To verify flutter is working correct on your environment.

