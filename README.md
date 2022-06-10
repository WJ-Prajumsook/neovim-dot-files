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

