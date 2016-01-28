
# R-Operator

Provides a `R`(replace) operator for vim. The operation replaces the text object or motion
with the content of the specified or default register.

Works as you would expect `c/change` or `d/delete` to work.


## Installation

* [Pathogen](https://github.com/tpope/vim-pathogen)
  ```sh
  cd ~/.vim/bundle && git clone https://github.com/romgrk/replace.vim
# or 
  cd ~/.vim/bundle 
  git submodule add https://github.com/romgrk/replace.vim

  ```
* [NeoBundle](https://github.com/Shougo/neobundle.vim)

   ```vim
   NeoBundle 'romgrk/replace.vim'
   ```

* [Vundle](https://github.com/gmarik/vundle)

   ```vim
   Bundle 'romgrk/replace.vim'
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

```vim
nmap R <Plug>ReplaceOperator
vmap R <Plug>ReplaceOperator

" This is like calling R with g:replace_register=='|'
nmap X <Plug>ExchangeOperator
```

Then `Ri(`, `veR`, `yyRR`, etc.

# License

Same as JSON license

