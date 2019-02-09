let g:ale_linters = {'cpp': ['ccls'],'python':['pyls']}
let g:ale_sign_column_always = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['autopep8'],
\   'cpp': ['clang-format'],
\}

nnoremap <Leader>af :ALEFix<CR>
nnoremap <Leader>ad :ALEDetail<CR>
