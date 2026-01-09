# nvim-config

A modular Neovim configuration based on
[kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim), reorganized into
a multi-file structure and extended with additional plugins.

## Structure

```text
├── init.lua              # Entry point - loads core config and bootstraps lazy.nvim
├── lua/
│   ├── core/
│   │   ├── options.lua   # Editor options (vim.opt settings)
│   │   ├── keymaps.lua   # Global keybindings
│   │   └── autocmds.lua  # Autocommands
│   ├── plugins/
│   │   ├── editor/       # Editor enhancements
│   │   ├── git/          # Git integration
│   │   ├── lsp/          # Language server & completion
│   │   ├── testing/      # Test runners
│   │   └── treesitter/   # Syntax highlighting & text objects
│   └── themes/           # Colorschemes
```

Each plugin has its own file for easy customization and maintenance.

## Plugins

### Editor

- **telescope.nvim** - Fuzzy finder
- **oil.nvim** - File explorer
- **harpoon** - Quick file navigation
- **which-key.nvim** - Keybinding hints
- **mini.nvim** - Collection of small utilities
- **conform.nvim** - Formatting
- **nvim-lint** - Linting
- **overseer.nvim** - Task runner
- **todo-comments.nvim** - Highlight TODO comments
- **nvim-autopairs** - Auto-close brackets
- **guess-indent.nvim** - Auto-detect indentation

### Git

- **gitsigns.nvim** - Git signs in gutter
- **diffview.nvim** - Git diff viewer
- **git-conflict.nvim** - Conflict resolution

### LSP

- **nvim-lspconfig** - LSP configuration
- **blink.cmp** - Completion
- **lazydev.nvim** - Neovim Lua development

### Testing

- **neotest** - Test runner (Go, Vitest, Jest)

### Treesitter

- **nvim-treesitter** - Syntax highlighting
- **treesitter-context** - Sticky context
- **treesitter-textobjects** - Enhanced text objects

### Themes

- rose-pine
- tokyonight

## Installation

### Requirements

- Neovim >= 0.9.0 (stable or nightly)
- git
- A C compiler (gcc)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [fd](https://github.com/sharkdp/fd)
- A [Nerd Font](https://www.nerdfonts.com/) (optional, but recommended)

### Install

Back up your existing config if you have one:

```sh
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

Clone this repository:

```sh
git clone https://github.com/davidmks/nvim-config.git ~/.config/nvim
```

Start Neovim:

```sh
nvim
```

Lazy.nvim will automatically install all plugins on first launch.

## Customization

- **Add a plugin**: Create a new `.lua` file in the appropriate
  `lua/plugins/` subdirectory
- **Change keymaps**: Edit `lua/core/keymaps.lua`
- **Change options**: Edit `lua/core/options.lua`
- **Switch theme**: Edit files in `lua/themes/`

## Credits

Based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
by the Neovim community.
