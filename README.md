
# R-Operator

Provides a `R`(replace) operator for vim. The operation replaces the text object or motion
with the content of the specified or default register.

Works as you would expect `c/change` or `d/delete` to work.

Use-case:
You need to replace some text with the content of a register (most likely the default), while keeping the register content as is. 

Example sequence: (cursor at **|**)
```
This is a |sentence (with some brackets in it) over.
```
:`ye` => @@ contains `'sentence'`

:`f(`
```
This is a sentence (|with some brackets in it) over.
```
:`Rib` => @@ still contains `'sentence'`
```
This is a sentence (|sentence) over.
```

The replaced text is sent to blank register by default. This is configurable. (see below or doc)

## Installation

* [Pathogen](https://github.com/tpope/vim-pathogen)
  ```sh
  cd ~/.vim/bundle && git clone https://github.com/romgrk/replace.vim
# or 
  cd ~/.vim/bundle 
  git submodule add https://github.com/romgrk/replace.vim

  ```
  
* [VimPlug](https://github.com/junegunn/vim-plug)

   ```vim
   Plug 'romgrk/replace.vim'
   ```
  
* [NeoBundle](https://github.com/Shougo/neobundle.vim)

   ```vim
   NeoBundle 'romgrk/replace.vim'
   ```

* Manual

  ```sh
  # You should know what to do of you're going manual.
  ```

## Configuration

```vim
let g:replace_register = '_' " Default
```

The deleted text is placed in register `g:replace_register`.
Set it to `'|'` to exchange the value of the register and 
the selected text.

## Usage

**!** Map the operator in your rc files!

```vim
nmap R <Plug>ReplaceOperator
vmap R <Plug>ReplaceOperator

" This is like calling R with g:replace_register=='|'
nmap X <Plug>ExchangeOperator
```

Then `Ri(`, `veR`, `yyRR`, etc.

# License

Same as JSON license

