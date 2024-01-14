function! OpenFileExplorer()
  let dict = {
        \ "win32": "start explorer /e,",
        \ "win64": "start explorer /e,",
        \ "linux": "xdg-open",
        \ "mac":   "open",
        \ }

  if empty(filter(dict, "has(v:key)"))
    throw "Unsupported operating system"
  endif

  let cmd = printf("%s %s", values(dict)[0], shellescape(expand("%:p:h"), 1))
  if exists("*job_start")
    execute "!" .. cmd
  else
    call jobstart(cmd, {"detach": 1})
  endif
	echo "Opened file explorer"
endfunction

function! CopyFilepathToClipboard()
	let @+=substitute(expand("%:p"), "\\", "/", "g")
	echo "Copied string \"" .. @+ .. "\" to clipboard"
endfunction

" the q is always pressed by accident
cabbrev wq w

" simply disable :q completely, :quit still works
cabbrev q <Nop>

" indent based on paste position
nnoremap p ]p
nnoremap P [p

" recapture visual when indenting
vnoremap < <gv
vnoremap > >gv

" switch buffers
nnoremap <c-b> :ls<cr>:b<space>

" clipboard register
imap <c-r><space> <c-r>+
imap <c-r><c-r> <c-r>"
map <leader><space> "+

nnoremap <leader>e :call OpenFileExplorer()<cr>
nnoremap <leader>cp :call CopyFilepathToClipboard()<cr>
nnoremap <leader>v :e $MYVIMRC<cr>
