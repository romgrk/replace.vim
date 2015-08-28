" File: replace.vim
" Author: romgrk
" Description: R-operator
" Exec: !::exe [echo 'NOT AUTOSOURCED']

" Use register
"let g:replace_register = '_'

" Mappings
nnoremap <expr> <Plug>ReplaceOperator   <SID>setOpfunc('replace')
nnoremap <expr> <Plug>ExchangeOperator  <SID>setOpfunc('exchange')

vnoremap <Plug>ReplaceOperator  :<C-u>call <SID>replaceOpfunc(visualmode())<CR>
vnoremap <Plug>ExchangeOperator :<C-u>call <SID>exchangeOpfunc(visualmode())<CR>

" Public: s:replace() wrappers
fu! s:replaceOpfunc (motion) 
    let type     = get(a:, 'motion')
    let register = get(g:, 'replace_register', '_')
    call s:replace(type, register)
endfu

fu! s:exchangeOpfunc (motion) 
    let type     = get(a:, 'motion')
    call s:replace(type, '|')
endfu

" Private: setup opfunc when called from normal-mode
function! s:setOpfunc (name) 
    exe 'set opfunc=<SNR>'.s:SID().'_'.a:name.'Opfunc'
    return 'g@' 
endfu

" Private: replace operation
function! s:replace (type, register) 
    let type = get(a:, 'type')

    if     type==#'char' | let expr = "`[v`]"
    elseif type==#'line' | let expr = "'[v']"
    elseif type==#'v'    | let expr = "`<v`>"
    elseif type==#'V'    | let expr = "'<V'>"
    else | return | end

    let delreg = get(a:, 'register', '_')
    let putreg = v:register

    if delreg==#'|' 
        let delreg = putreg             | end
    if delreg==#putreg
        let newval = getreg(putreg, 1)  | end

    exe 'normal! '.expr
    exe 'normal! "'.delreg.'d'

    if delreg==#putreg
        let oldval = getreg(delreg, 1)  
        call setreg(putreg, newval)     | end

    exe 'normal! "'.putreg.'P'

    if delreg==#putreg
        call setreg(putreg, oldval)     | end

    "echo 'R:'.delreg.putreg.'='.oldval
endfu

fu! s:SID()
    return matchstr(expand('<sfile>'),'<SNR>\zs\d\+\ze_SID$')
endfu

