-- ~/.config/nvim/init.lua
-- ============================================================================
-- Leaders & Global Settings
-- ============================================================================
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true -- Keep for icon plugins later
-- ============================================================================
-- Core Editor Behavior
-- ============================================================================
vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = "a"

-- Clipboard (async is fine, schedule not needed for this)
vim.o.clipboard = "unnamedplus"

-- Line wrapping (kept together)
vim.o.breakindent = true
vim.o.linebreak = true

-- Undo persistence
vim.o.undofile = true

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true

-- UI Elements
vim.o.signcolumn = "yes"
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.splitright = true
vim.o.splitbelow = true

-- Performance
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Display
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.o.colorcolumn = "80,100" -- Moved here with other display settings

-- Command line
vim.o.inccommand = "split"
vim.o.confirm = true

-- ============================================================================
-- Indentation (grouped together)
-- ============================================================================
vim.o.shell = vim.fn.executable("fish") == 1 and "fish" or vim.o.shell
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4

-- ============================================================================
-- Folding (fixed)
-- ============================================================================
vim.o.foldmethod = "expr"
vim.o.foldenable = true
vim.o.foldlevel = 99 -- Start with ALL folds open (99 = no folding by default)
vim.o.foldtext = "" -- Empty = use default
-- Use treesitter for folding (requires nvim-treesitter plugin)
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- ============================================================================
-- Diagnostics (one call, not config table in v0.9+)
-- ============================================================================
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true, -- Added: show more severe errors first
	float = { border = "rounded" }, -- Added: prettier float windows
})
