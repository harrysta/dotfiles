# Packages

These should be available in the distro's package manager.
- [vim](https://github.com/vim/vim)/[neovim](https://github.com/neovim/neovim) (Text editor)
- [tmux](https://github.com/tmux/tmux) (Terminal multiplexer)
- [jq](https://github.com/jqlang/jq) (JSON parser)
- [bat](https://github.com/sharkdp/bat) (Printer and pager with syntax highlighting)

# Setup

### install

Execute the following:
```sh
git clone https://github.com/harrysta/dotfiles
cd dotfiles
./install.sh --all
```

This will inject lines to .profile, .bashrc, vim, neovim, and tmux's config files
such that they additionally source the dotfiles' config files.

### Vim/Neovim

Vim config files are split into vanilla and ide modules, which their sourcing call
will be injected inside the .vimrc/init.vim file by the install script. The purpose
of this is to provide sourcing of configuration based on compatibility and tooling
required on the system used.

[vanilla.vim](https://github.com/harrysta/dotfiles/blob/main/nvim/.config/nvim/vanilla.vim)
is written purely in vimscript so that it is usable by both neovim and vim.

[ide.lua](https://github.com/harrysta/dotfiles/blob/main/nvim/.config/nvim/ide.lua)
contains lua configuration that is only compatible with neovim, and provides IDE-like
features using various plugins. This file also provides the ability to easily install
and use a theme, by defining g:colorscheme, which must contain the path of the repository
(author/project_name) and the name (used to call "colorscheme <name>" internally).

Example .vimrc/init.vim:

```vim
# these are all injected
let g:colorscheme = { "path": "tomasiser/vim-code-dark", "name": "codedark" } " harrysta/dotfiles
source $DOTFILES/vim/vanilla.vim " harrysta/dotfiles
source $DOTFILES/vim/ide.lua " harrysta/dotfiles
```
