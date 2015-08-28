" File: replace.vim
" Author: romgrk
" Description: R-operator
" Exec: !::exe [echo 'NOT AUTOSOURCED']

" Mappings
nnoremap <expr> <Plug>ReplaceOperator <SID>replaceOperatorExpr()
vnoremap <Plug>ReplaceOperator :<C-u><SID>replaceOperatorFunc(
                             \ visualmode())<CR>

" Setup opfunc for R-operator
function! s:replaceOperatorExpr () 
    exe 'set opfunc=<SNR>'.s:SID().'_replaceOperatorFunc'
    return 'g@' 
endfu

" R-operator func
function! s:replaceOperatorFunc (motion) 
    let motion = get(a:, 'motion', '')

    if     motion==#'char' | let expr = "`[v`]"
    elseif motion==#'line' | let expr = "'[v']"
    elseif motion==#'v'    | let expr = "`<v`>"
    elseif motion==#'V'    | let expr = "'<V'>"
    else | return | end
    exe 'normal! ' expr.'"_d"'.v:register.'P'
    " TODO add option to notsend deleted text to "_
endfu

fu! s:SID()
    return matchstr(expand('<sfile>'),'<SNR>\zs\d\+\ze_SID$')
endfu

