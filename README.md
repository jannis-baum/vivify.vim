# vivify.vim

This plugin connects Vim to [vivify Markdown
viewer](https://github.com/jannis-baum/vivify).

Neovim is supported.

## Features

- all open viewers automatically update their content as you are editing it in Vim
- all open viewers automatically scroll to keep in sync with your cursor in Vim
- open the current buffer's contents in vivify with `:Vivify`

## Configuration

- `g:vivify_instant_refresh = 1`
    - refresh page contents on `TextChanged` and `TextChangedI` (default)
- `g:vivify_instant_refresh = 0`
    - refresh page contents on `CursorHold` and `CursorHoldI`
- `g:vivify_filetypes`
    - additional filetypes to recognize as markdown
    - for example `let g:vivify_filetypes = ['vimwiki']`

## Installation

With [vivify](https://github.com/jannis-baum/vivify) installed in your PATH, you
can install this plugin just like any other Vim plugin, e.g.

- with Vim8's native plugin manager by adding it to your
  `~/.vim/pack/plugin/start` (works best as a [submodule of your
  dotfiles](https://github.com/jannis-baum/dotfiles)
- with Plug: `Plug jannis-baum/vivify.vim`
- with Lazy: `{ "jannis-baum/vivify.vim" }`
- ...
