let g:LanguageClient_autoStart = 1
set completefunc=LanguageClient#complete
let g:LanguageClient_serverCommands = {
    \ 'r': ['R', '--quiet', '--slave', '-e', 'languageserver::run()'],
    \  'python': ['python3', '-m', 'pyls'],
    \ }

let g:LanguageClient_diagnosticsEnable=0

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
