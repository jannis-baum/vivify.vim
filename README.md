# vivify.vim

This plugin connects Vim and Neovim to the live markdown viewer
[Vivify](https://github.com/jannis-baum/Vivify).

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/jannis-baum/assets/refs/heads/main/Vivify/showcase-dark.gif">
  <source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/jannis-baum/assets/refs/heads/main/Vivify/showcase-light.gif">
  <img alt="Showcase" src="https://raw.githubusercontent.com/jannis-baum/assets/refs/heads/main/Vivify/showcase-dark.gif">
</picture>

## Features

- open the current buffer's contents in Vivify with `:Vivify`
- all open viewers automatically update their content as you are editing it in Vim
- all open viewers automatically scroll to keep in sync with your cursor in Vim

## Configuration

- `g:vivify_instant_refresh = 1`
    - refresh page contents on `TextChanged` and `TextChangedI` (default)
- `g:vivify_instant_refresh = 0`
    - refresh page contents on `CursorHold` and `CursorHoldI`
- `g:vivify_auto_scroll = 1`
    - enable viewer auto-scroll (default)
- `g:vivify_auto_scroll = 0`
    - disable viewer auto-scroll
- `g:vivify_filetypes`
    - additional filetypes to recognize as markdown
    - for example `let g:vivify_filetypes = ['vimwiki']`

## Installation

With [Vivify](https://github.com/jannis-baum/Vivify) installed in your PATH, you
can install this plugin just like any other Vim plugin, e.g.

- with Vim8's native plugin manager by adding it to your
  `~/.vim/pack/plugin/start` (works best as a [submodule of your
  dotfiles](https://github.com/jannis-baum/dotfiles)
- with Plug: `Plug jannis-baum/vivify.vim`
- with Lazy: `{ "jannis-baum/vivify.vim" }`
- ...
