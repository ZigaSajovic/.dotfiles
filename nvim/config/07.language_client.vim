let g:LanguageClient_autoStart = 1
set completefunc=LanguageClient#complete
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


"nn <silent> xh :call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'L'})<cr>
"nn <silent> xj :call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'D'})<cr>
"nn <silent> xk :call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'U'})<cr>
"nn <silent> xl :call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'R'})<cr>


"" bases
"nn <silent> xb :call LanguageClient#findLocations({'method':'$ccls/inheritance'})<cr>
"" bases of up to 3 levels
"nn <silent> xB :call LanguageClient#findLocations({'method':'$ccls/inheritance','levels':3})<cr>
"" derived
"nn <silent> xd :call LanguageClient#findLocations({'method':'$ccls/inheritance','derived':v:true})<cr>
"" derived of up to 3 levels
"nn <silent> xD :call LanguageClient#findLocations({'method':'$ccls/inheritance','derived':v:true,'levels':3})<cr>

"" caller
"nn <silent> xc :call LanguageClient#findLocations({'method':'$ccls/call'})<cr>
"" callee
"nn <silent> xC :call LanguageClient#findLocations({'method':'$ccls/call','callee':v:true})<cr>

"" $ccls/member
"" nested classes / types in a namespace
"nn <silent> xs :call LanguageClient#findLocations({'method':'$ccls/member','kind':2})<cr>
"" member functions / functions in a namespace
"nn <silent> xf :call LanguageClient#findLocations({'method':'$ccls/member','kind':3})<cr>
"" member variables / variables in a namespace
"nn <silent> xm :call LanguageClient#findLocations({'method':'$ccls/member'})<cr>

"nn xx x
