# Packages

These should be available in the distro's package manager.
- xorg (X11 display server)
- libxinerama (Required library for compiling DWM)
- wget (Web protocol utility)
- gcc (C/C++ compiler)
- make (Execution operator used mostly for C/C++ projects)
- ALSA (Kernel API for audio)
- [vim](https://github.com/vim/vim)/[neovim](https://github.com/neovim/neovim) (Text editor)
- [tmux](https://github.com/tmux/tmux) (Terminal multiplexer)
- [feh](https://github.com/derf/feh) (Image viewer + wallpaper changer)
- [Hack Font](https://github.com/source-foundry/Hack) (Terminal font)

# Setup

### Clean install

Remove .bashrc, .bash_profile, .profile from your $HOME directory.\
Execute the following:
```sh
git clone https://github.com/harrysta/dotfiles
cd dotfiles
stow --no-folding
```

### Custom install

Remove local config and rc files of desired app (located at ~/, ~/.config and ~/.local/share\
Then execute:
```sh
cd dotfiles
stow [LIST OF AVAILABLE DOTFILES SEPARATED BY SPACE]
```


### Vim/Neovim

Vim config files are split into vanilla and ide modules, which are to be manually
called in the .vimrc/init.vim file. The purpose of this is to provide sourcing of
configuration based on compatibility and tooling required on the system used.

[vanilla.vim](https://github.com/harrysta/dotfiles/blob/main/nvim/.config/nvim/vanilla.vim)
is written purely in vimscript so that it is usable with both neovim and vim.

[ide.lua](https://github.com/harrysta/dotfiles/blob/main/nvim/.config/nvim/ide.lua)
contains lua configuration that is only compatible with neovim, and provides IDE-like
features using various plugins. This file also provides the ability to easily install
and use a theme, by defining g:colorscheme, which contains the name in the form
plugin managers understand (author/theme_name), and ColorschemeFunc(), which contains
settings to apply after the theme has succesfully installed.


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
