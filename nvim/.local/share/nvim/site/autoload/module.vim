" g:mpath must be defined by .vimrc/init.vim
function! module#src(file)
  exec 'source ' . g:mpath . a:file . '.vim'
endfunction
