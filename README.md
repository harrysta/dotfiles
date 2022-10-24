# Packages

These should be available in the distro's package manager.
- xorg (X11 display server)
- libxinerama (Required library for compiling DWM)
- wget (Web protocol utility)
- gcc (C/C++ compiler)
- make (Execution operator used mostly for C/C++ projects)
- alsa (Kernel API for audio)
- nvidia (Proprietary graphics driver)
- [vim](https://github.com/vim/vim)/[neovim](https://github.com/neovim/neovim) (Text editor)
- [tmux](https://github.com/tmux/tmux) (Terminal multiplexer)
- [feh](https://github.com/derf/feh) (Image viewer + wallpaper changer)
- [maim](https://github.com/naelstrof/maim) (Screenshot utility)
- [xclip](https://github.com/astrand/xclip) (Clipboard interface)
- [Font Awesome](https://github.com/FortAwesome/Font-Awesome) (Icons for DWM status bar)
- [Hack Font](https://github.com/source-foundry/Hack) (Terminal font)
- [Capitaine Cursors](https://github.com/keeferrourke/capitaine-cursors) (Cursor theme)

# Setup

### Clean install

Remove .bashrc, .bash_profile, .profile from your $HOME directory.  
Execute the following:
```sh
git clone https://github.com/harrysta/dotfiles
cd dotfiles
stow --no-folding
```
Log out and log in again to finally call:
```sh
cd dotfiles/init
chmod +x install.sh
. install.sh
```

### Custom install

Remove local config and rc files of desired app (located at ~/, ~/.config and ~/.local/share
Then execute:
```sh
cd dotfiles
stow [LIST OF AVAILABLE DOTFILES SEPARATED BY SPACE]
```


### Vim/Neovim

Vim config files are split into vanilla and ide, which are to be manually called from the .vimrc/init.vim file itself to be used.
The purpose of this is to provide sourcing of configuration based on compatibility and usability required in any given moment.

[vanilla.vim](https://github.com/harrysta/dotfiles/blob/main/nvim/.config/nvim/vanilla.vim) contains vimscript configuration that is
compatible with vim.

[ide.lua](https://github.com/harrysta/dotfiles/blob/main/nvim/.config/nvim/ide.lua) contains lua configuration that is only compatible with
neovim, and provides IDE-like features using various plugins. This file also provides the ability to easily install and use a theme, by defining
g:colorscheme, which contains the name in the form plugin managers understand (author/theme_name), and ColorschemeFunc(), which contains settings
to apply after the theme has succesfully installed.


Example .vimrc/init.vim:

```vim
" This line is used for plugin installation
let g:colorscheme = "tomasiser/vim-code-dark"
" This won't throw an error if theme hasn't succesfully installed
function! ColorschemeFunc()
    " Theme-specific settings
    set t_Co=256
    set t_ut=
    " Finish up by actually applying a theme
    colorscheme codedark
end function

" If init.vim is in the same directory, simply call by ./[filename]
runtime ./vanilla.vim
runtime ./ide.lua
```
