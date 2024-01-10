let s:curr_file = expand("<sfile>:h")
function Source(s)
  execute 'source ' .. s:curr_file .. '/' .. a:s
endfunction

function SetCOpts()
  setlocal tabstop=8
  setlocal colorcolumn=80
  setlocal softtabstop=8
  setlocal shiftwidth=8
  setlocal noexpandtab
  setlocal wrap
endfunction

function! s:PreventFilenameLength(len)
  if len(expand('%:t')) < a:len
    throw "File name too short"
  endif
endfunction

execute 'set path+=' . fnamemodify(expand('%'), ':h') . '/**'
runtime macros/matchit.vim " jump between matching tags
call Source('settings.vim')
call Source('mappings.vim')

augroup VanillaGroup
  autocmd!

  " disable auto-commenting new lines under commented ones
  autocmd Filetype * set formatoptions-=cro

  " special opts
  autocmd Filetype,BufNewFile,BufRead *.c,*.h,*.cpp :call SetCOpts()
  autocmd FileType,BufNewFile,BufRead markdown setlocal nocindent

  " prevent short filenames before writing
  autocmd BufWritePre * call s:PreventFilenameLength(2)
augroup END
