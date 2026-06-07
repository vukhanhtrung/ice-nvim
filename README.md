# ice-nvim

my nvim config

---

## Plugins

All plugins installed via `vim.pack.add()`.

### AI

| Plugin | Description |
|---|---|
| [opencode.nvim](https://github.com/nickjvandyke/opencode.nvim) | AI-assisted coding integration with OpenCode |

### Completion & Snippets

| Plugin | Description |
|---|---|
| [blink.cmp](https://github.com/saghen/blink.cmp) | Autocompletion engine |
| [blink.lib](https://github.com/saghen/blink.lib) | Library dependency for blink.cmp |
| [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) | Collection of common snippets |

### LSP

| Plugin | Description |
|---|---|
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP configuration presets |
| [auto-lsp.nvim](https://github.com/WieeRd/auto-lsp.nvim) | Auto-attach LSP servers per filetype |

### Formatting

| Plugin | Description |
|---|---|
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Formatter runner (stylua configured for Lua) |

### Fuzzy Finder

| Plugin | Description |
|---|---|
| [fzf-lua](https://github.com/ibhagwan/fzf-lua) | Fuzzy finder for files, grep, LSP symbols, diagnostics, code actions |
| [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) | File type icons |

### File Explorer

| Plugin | Description |
|---|---|
| [mini.files](https://github.com/echasnovski/mini.files) | Minimal file explorer |

### Syntax & Treesitter

| Plugin | Description |
|---|---|
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Treesitter-based syntax highlighting and folding |

### Navigation

| Plugin | Description |
|---|---|
| [flash.nvim](https://github.com/folke/flash.nvim) | Jump and search motions |

### Git

| Plugin | Description |
|---|---|
| [mini.diff](https://github.com/nvim-mini/mini.diff) | Inline diff overlay |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git signs in gutter *(disabled)* |

### Scrolling

| Plugin | Description |
|---|---|
| [neoscroll.nvim](https://github.com/karb94/neoscroll.nvim) | Smooth scrolling animations |
| [nvim-scrollview](https://github.com/dstein64/nvim-scrollview) | Scrollbar signs column |

### UI

| Plugin | Description |
|---|---|
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Keybinding hints popup |
| [catppuccin](https://github.com/catppuccin/nvim) | Color scheme (Frappe flavour) |

### Editing

| Plugin | Description |
|---|---|
| [better-escape.nvim](https://github.com/max397574/better-escape.nvim) | Escape insert mode with `jj`/`jk` |

### Disabled

These plugins are in `lua/plugins/disabled/` and not loaded.

| Plugin | Reason |
|---|---|
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Replaced by mini.diff for git diffing |
| [yazi.nvim](https://github.com/mikavilpas/yazi.nvim) | Requires `yazi` binary; replaced by mini.files |

---

## Configuration

Notable deviation from default Neovim behavior.

### Leader Keys

```lua
vim.g.mapleader = " "
vim.g.maplocalleader = " "
```

Space is the leader key for all keymaps.

### Line Numbers

```lua
vim.o.number = true
vim.o.relativenumber = true
```

Hybrid line numbers: current line shows absolute number, others show relative distance.

### Clipboard

```lua
vim.o.clipboard = "unnamedplus"
```

Uses the system clipboard by default for yank/paste operations.

### Indentation

```lua
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
```

4 spaces instead of default 8-space tabs.

### Line Wrapping

```lua
vim.o.breakindent = true
vim.o.linebreak = true
```

Wrapped lines are indented and break at word boundaries.

### Undo Persistence

```lua
vim.o.undofile = true
```

Undo history survives between sessions.

### Search

```lua
vim.o.ignorecase = true
vim.o.smartcase = true
```

Case-insensitive search, but case-sensitive when the query contains uppercase.

### Splits

```lua
vim.o.splitright = true
vim.o.splitbelow = true
```

Vertical splits open to the right; horizontal splits open below. Default is left/above.

### UI

```lua
vim.o.signcolumn = "yes"
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.colorcolumn = "80,100"
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
```

- Always-visible sign column
- Cursor line highlighted
- 10 lines of context above/below cursor
- Color column guides at 80 and 100
- Visible whitespace characters

### Performance

```lua
vim.o.updatetime = 250
vim.o.timeoutlen = 300
```

Faster UI updates and shorter key sequence timeout.

### Command Line

```lua
vim.o.inccommand = "split"
vim.o.confirm = true
```

`:substitute` previews in a split; unsaved changes prompt a confirmation dialog instead of failing.

### Folding

```lua
vim.o.foldmethod = "expr"
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
```

Treesitter-based folding. All folds start open (`foldlevel = 99`).

### Diagnostics

```lua
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = { border = "rounded" },
})
```

- Inline virtual text for errors
- Severity-sorted (most severe first)
- Rounded border on float windows

### Shell


```lua
-- Ctrl+h/j/k/l to move between splits
vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")
```

### LSP Keymaps

| Keymap | Action |
|---|---|
| `ga` | Switch to alternative file (centered) |
| `<C-k>` (insert) | LSP signature help |
| `<leader>ca` | Code action |
| `<leader>cr` | Rename symbol |
| `<leader>K` | Diagnostic hover float |
| `<leader>t` | Split terminal horizontally |

### Autocmds

- **Yank highlight**: briefly highlights yanked text
- **Auto-cd to project root**: changes working directory to the LSP workspace root on attach

### Theme

Catppuccin with the **Frappe** flavour.

### Plugin Keymaps

| Keymap | Plugin | Action |
|---|---|---|
| `jj` / `jk` | better-escape | Exit insert mode |
| `s` / `S` | flash.nvim | Jump / treesitter jump |
| `<leader>e` | mini.files | File explorer |
| `<leader>go` | mini.diff | Toggle diff overlay |
| `<leader><leader>` / `<leader>ff` | fzf-lua | Find files |
| `<leader>/` | fzf-lua | Live grep |
| `<leader>fd` / `<leader>fD` | fzf-lua | Document / workspace diagnostics |
| `<leader>fs` / `<leader>fS` | fzf-lua | Document / workspace symbols |
| `<leader>fr` | fzf-lua | LSP references |
| `<leader>ca` | fzf-lua | Code actions (overrides LSP default) |
| `=` | conform.nvim | Format document |
| `<leader>at` | opencode.nvim | Follow AGENT-TODO |
| `<leader>aa` | opencode.nvim | Ask OpenCode |
| `<leader>as` | opencode.nvim | Cycle options |
| `<leader>ac` | opencode.nvim | Select agent |
| `<M-u>` / `<M-d>` | opencode.nvim | Scroll output |
| `<leader>ai` | opencode.nvim | Interrupt session |
