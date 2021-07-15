"fzf finder
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=1 showmode ruler
autocmd FileType fzf setlocal norelativenumber
let $FZF_DEFAULT_COMMAND = 'ag -l ""'
let g:fzf_layout = { 'down': '~20%' }

function! s:defs(commands)
  let prefix = get(g:, 'fzf_command_prefix', '')
  if prefix =~# '^[^A-Z]'
    echoerr 'g:fzf_command_prefix must start with an uppercase letter'
    return
  endif
  for command in a:commands
    let name = ':'.prefix.matchstr(command, '\C[A-Z]\S\+')
    if 2 != exists(name)
      execute substitute(command, '\ze\C[A-Z]', prefix, '')
    endif
  endfor
endfunction

function! s:fzf_preview_window(...)
  return &columns > 80 ? call('fzf#vim#with_preview', a:000) : {}
endfunction

call s:defs([
\'command!      -bang -nargs=? -complete=dir Files       call fzf#vim#files(<q-args>, s:fzf_preview_window(), <bang>0)',
\'command!      -bang -nargs=? GitFiles                  call fzf#vim#gitfiles(<q-args>, s:fzf_preview_window(<q-args> == "?" ? { "placeholder": "" } : {}), <bang>0)',
\'command!      -bang -nargs=? GFiles                    call fzf#vim#gitfiles(<q-args>, s:fzf_preview_window(<q-args> == "?" ? { "placeholder": "" } : {}), <bang>0)',
\'command! -bar -bang -nargs=? -complete=buffer Buffers  call fzf#vim#buffers(<q-args>, s:fzf_preview_window({ "placeholder": "{1}" }), <bang>0)',
\'command!      -bang -nargs=* Lines                     call fzf#vim#lines(<q-args>, <bang>0)',
\'command!      -bang -nargs=* BLines                    call fzf#vim#buffer_lines(<q-args>, <bang>0)',
\'command! -bar -bang Colors                             call fzf#vim#colors(<bang>0)',
\'command!      -bang -nargs=+ -complete=dir Locate      call fzf#vim#locate(<q-args>, s:fzf_preview_window(), <bang>0)',
\'command!      -bang -nargs=* Ag                        call fzf#vim#ag(<q-args>, s:fzf_preview_window(), <bang>0)',
\'command!      -bang -nargs=* Rg                        call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1, s:fzf_preview_window(), <bang>0)',
\'command!      -bang -nargs=* Tags                      call fzf#vim#tags(<q-args>, s:fzf_preview_window({ "placeholder": "--tag {2}:{-1}:{3}" }), <bang>0)',
\'command!      -bang -nargs=* BTags                     call fzf#vim#buffer_tags(<q-args>, s:fzf_preview_window({ "placeholder": "{2}:{3}" }), <bang>0)',
\'command! -bar -bang Snippets                           call fzf#vim#snippets(<bang>0)',
\'command! -bar -bang Commands                           call fzf#vim#commands(<bang>0)',
\'command! -bar -bang Marks                              call fzf#vim#marks(<bang>0)',
\'command! -bar -bang Helptags                           call fzf#vim#helptags(<bang>0)',
\'command! -bar -bang Windows                            call fzf#vim#windows(<bang>0)',
\'command! -bar -bang Commits                            call fzf#vim#commits(s:fzf_preview_window({ "placeholder": "" }), <bang>0)',
\'command! -bar -bang BCommits                           call fzf#vim#buffer_commits(s:fzf_preview_window({ "placeholder": "" }), <bang>0)',
\'command! -bar -bang Maps                               call fzf#vim#maps("n", <bang>0)',
\'command! -bar -bang Filetypes                          call fzf#vim#filetypes(<bang>0)',
\'command!      -bang -nargs=* History                   call s:history(<q-args>, s:fzf_preview_window(), <bang>0)'])

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
nnoremap <M-w> :Windows<CR> 
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
