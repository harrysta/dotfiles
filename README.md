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

Remove local config and rc files of desired app (located at ~/, ~/.config and ~/.local/share)  
Then execute:
```sh
cd dotfiles
stow [LIST OF AVAILABLE DOTFILES SEPARATED BY SPACE]
```

### Vim/Neovim

Configs are broken down into modules, which are manually added in the .vimrc/init.vim file. The modules are located
in a directory called "modules" inside ~/.config/nvim (%localappdata%\nvim on Windows) and the module path (g:mpath) must be manually declared depending on OS.  
  
The [vanilla.vim](https://github.com/harrysta/dotfiles/blob/main/nvim/.config/nvim/modules/vanilla.vim) module
can be used out of the box, while the other modules are split into plugin installs and plugin configs.
These files are called plug_[MODULE NAME] and [MODULE NAME] respectively. [Vim-plug](https://github.com/junegunn/vim-plug) **must be installed** on the system
for the other modules to work.  
  
Example .vimrc/init.vim:

```vim
" Required
let g:mpath = "[PATH TO MODULES DIR]/modules/"

" Surround plug_ counterparts with vim-plug begin and end
call plug#begin()
" Simply provide name of file
call module#src('plug_essential')
call module#src('plug_web')
call plug#end()

" Contains no plugins or lua statements, hence no plug_ counterpart and can be used for .vimrc out of the box
call module#src('vanilla')

call module#src('essential')
call module#src('web')
```
