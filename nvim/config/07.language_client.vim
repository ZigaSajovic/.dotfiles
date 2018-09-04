let g:LanguageClient_autoStart = 1
set completefunc=LanguageClient#complete
let g:LanguageClient_serverCommands = {
    \ 'r': ['R', '--quiet', '--slave', '-e', 'languageserver::run()'],
    \ }

let g:LanguageClient_diagnosticsEnable=0
