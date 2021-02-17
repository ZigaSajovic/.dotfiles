"fzf finder
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=1 showmode ruler
autocmd FileType fzf setlocal norelativenumber
let g:fzf_layout = { 'down': '~20%' }

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'EndOfBuffer'] }


function! s:ag_to_qf(line)
  let parts = split(a:line, ':')
  return {'filename': parts[0], 'lnum': parts[1], 'col': parts[2],
        \ 'text': join(parts[3:], ':')}
endfunction

function! s:ag_handler(lines)
  if len(a:lines) < 2 | return | endif

  let cmd = get({'ctrl-x': 'split',
               \ 'ctrl-v': 'vertical split',
               \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
  let list = map(a:lines[1:], 's:ag_to_qf(v:val)')

  let first = list[0]
  execute cmd escape(first.filename, ' %#\')
  execute first.lnum
  execute 'normal!' first.col.'|zz'

  if len(list) > 1
    call setqflist(list)
    copen
    wincmd p
  endif
endfunction



command! -nargs=* Ag call fzf#run({
\ 'source':  printf('ag --nogroup --column --color "%s"',
\                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\')),
\ 'sink*':    function('<sid>ag_handler'),
\ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
\            '--multi --bind=alt-a:select-all,alt-d:deselect-all '.
\             '--prompt "Ag> "',
\ 'down':    '~30%'
\ })


function! s:ag_to_qfC(line)
  let parts = split(a:line, ':')
  return {'filename': expand('%'), 'lnum': parts[0], 'col': parts[1],
        \ 'text': join(parts[3:], ':')}
endfunction

function! s:ag_handlerC(lines)
  if len(a:lines) < 2 | return | endif

  let cmd = get({'ctrl-x': 'split',
               \ 'ctrl-v': 'vertical split',
               \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
  let list = map(a:lines[1:], 's:ag_to_qfC(v:val)')

  let first = list[0]
  execute cmd escape(first.filename, ' %#\')
  execute first.lnum
  execute 'normal!' first.col.'|zz'

  if len(list) > 1
    call setqflist(list)
    copen
    wincmd p
  endif
endfunction

command! -nargs=* Agc call fzf#run({
\ 'source':  printf('ag --nogroup --depth 0 --column --color -G "%s" "%s" "%s"',
\                   expand('%:t'),
\                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\'),
\                   expand('%:p')),
\ 'sink*':    function('<sid>ag_handlerC'),
\ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
\            '--multi --bind=alt-a:select-all,alt-d:deselect-all '.
\             '--prompt "Agc> "',
\ 'down':    '~30%'
\ })

command! -nargs=* Agc1 call fzf#run({
\ 'source':  printf('ag --nogroup --depth 1 --column --color -G "%s" "%s" "%s"',
\                   expand('%:t'),
\                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\'),
\                   expand('%:p')),
\ 'sink*':    function('<sid>ag_handlerC'),
\ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
\            '--multi --bind=alt-a:select-all,alt-d:deselect-all '.
\             '--prompt "Agc> "',
\ 'down':    '~30%'
\ })

"work with buffers
nnoremap <M-b> :Buffers<CR> 
nnoremap <M-B> :w<CR>:Buffers<CR>
"work with files
nmap <Leader><M-f> :Files<CR>
nmap <M-f> :Files<Space>
"work with Ag
nmap <Leader><M-a> :Agc<Space>
nmap <M-a> :Ag<Space>
"work with search
nmap <M-l> :BLines<CR>
nmap <Leader><M-s> :Lines<CR>
nmap <M-c> :Commands<CR>
nmap <M-h> :History:<CR>
nmap <M-s> :History/<CR>
