# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Configuration Architecture

This is a Neovim configuration that uses a hybrid approach with both Vim script (init.vim) and Lua modules (lua/). The configuration is split between:

- **init.vim**: Main configuration file containing plugin declarations, key mappings, theme settings, and vim-script based configuration
- **init0.lua**: Basic Lua settings and bootstrapping
- **lua/init.lua**: Module loader that requires all Lua configuration modules
- **lua/**: Individual feature modules (lsp.lua, statusline.lua, completion.lua, etc.)

## Plugin Management

- Uses **vim-plug** for plugin management (declared in init.vim lines 140-246)
- Plugins are installed via `:PlugInstall`
- Some plugins also use **lazy.nvim** (referenced in init0.lua and lazy-lock.json)
- Key plugins: Telescope, LSP (Mason), nvim-cmp, Treesitter, Neo-tree, Lualine

## LSP Configuration

LSP setup is in `lua/lsp.lua`:
- Uses Mason for LSP server management
- Configured for TypeScript (ts_ls), Dart, and other languages
- Includes null-ls for formatting (Stylua, Prettier)
- Document symbols integration with nvim-navic for breadcrumbs

## Key Mappings & Leader Key

- Leader key: `<Space>`
- Main mappings in init.vim (lines 71-127):
  - `<leader>f`: Telescope find files
  - `<leader>g`: Telescope live grep
  - `<leader>b`: Telescope buffers
  - `<leader>ee`: Neo-tree file explorer
  - `<leader>rn`: LSP rename
  - `<leader>a`: LSP code actions
  - `<leader>z`: No Neck Pain (zen mode)

## Custom Features

- **Media Control**: Integrated playerctl commands for MPD/Spotify in statusline (lua/statusline.lua)
- **Custom Statusline**: Lualine configuration with media controls and click handlers
- **Zen Mode**: No Neck Pain plugin for distraction-free editing
- **Claude Code Integration**: Has claude-code.nvim plugin installed

## Development Commands

- **Reload config**: `:Reload` (sources init.vim)
- **Plugin management**: `:PlugInstall`, `:PlugUpdate`, `:PlugClean`
- **LSP commands**: Built-in via Telescope and key mappings
- **Format code**: `fmt` mapping calls `vim.lsp.buf.format()`

## Theme & Appearance

- Primary theme: tokyonight-storm
- Color schemes available: catppuccin, dracula, onedarker, neon
- Custom highlight groups for todo comments and diagnostics
- Uses Nerd Fonts icons throughout

## Node.js Runtime

Configuration specifies Bun as the Node.js runtime: `let g:node_host_prog = '/home/kelly/.bun/bin/bun'`