
# Replace & Exchange Operator

Provides a replace and an exchange operator for vim.
The operation replaces the text object or motion with the content of the specified register.

**ReplaceOperator** use-case:
You need to replace some text with the content of a register (most likely the
default), while keeping the register content as is.

**ExchangeOperator** use-case:
You need to exchange some content with the content of the register.


**ReplaceOperator** example sequence: (cursor at `|`, `<Plug>ReplaceOperator` mapped to `R`)
```
This is a |sentence (with some brackets in it) over.
```
`ye` yank end
`f(` find (
`Ri(` replace inside (
```
This is a sentence (|sentence) over.
```
The replaced text is sent to the blank register by default.
This is configurable. (see below or doc)


**ExchangeOperator** example sequence: (cursor at `|`, `<Plug>ExchangeOperator` mapped to `X`)
```
let value = getPosition(|value, other)
```
`ye` yank end
`W` move W
`Xe` eXchange end
```
let value = getPosition(value, value|)
```
`yiw` yank inside word
`Bb` move back to `value`
`Xe` eXchange end
```
let value = getPosition(other|, value)
```


## Usage

*No default mappings are provided*

```vim
nmap R <Plug>ReplaceOperator
vmap R <Plug>ReplaceOperator
" Alternative: s for 'substitute'
nmap s <Plug>ReplaceOperator
vmap s <Plug>ReplaceOperator

nmap X <Plug>ExchangeOperator
```


## Configuration

```vim
let g:replace_register = '_' " Default: sends Replaced content to black hole register
```

The deleted text is placed in register `g:replace_register`.
Set it to `'|'` to exchange the value of the register and the selected text.
(In which case, `ReplaceOperator` will act exactly as `ExchangeOperator`)


# License

Same as JSON license
