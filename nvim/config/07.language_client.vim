let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
    \ 'r': ['R', '--quiet', '--slave', '-e', 'languageserver::run()'],
    \  'python': ['python3', '-m', 'pyls'],
    \ 'cpp': ['/home/ziga/ccls/Release/ccls', '--log-file=/tmp/cc.log'],
    \ }

let g:LanguageClient_diagnosticsEnable = 0
let g:LanguageClient_hasSnippetSupport = 0



nnoremap <F5> :call LanguageClient_contextMenu()<CR>

nn <silent> <M-j> :call LanguageClient#textDocument_definition()<cr>
nn <silent> <M-,> :call LanguageClient#textDocument_references({'includeDeclaration': v:false})<cr>
nn <silent> K :call LanguageClient#textDocument_hover()<cr>
