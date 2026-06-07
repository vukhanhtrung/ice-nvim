vim.pack.add({
	"https://github.com/saghen/blink.lib",
	"https://github.com/saghen/blink.cmp",
	"https://github.com/rafamadriz/friendly-snippets",
})
local cmp = require("blink.cmp")
cmp.build():pwait()
cmp.setup({
	keymap = {
		-- Using a custom table instead of the "default" preset
		preset = "default", -- Start with the defaults, then override
		["<Tab>"] = { "select_next", "fallback" }, -- Tab: go to next item
		["<S-Tab>"] = { "select_prev", "fallback" }, -- Shift+Tab: go to previous item
		["<CR>"] = { "accept", "fallback" }, -- Enter: accept the selected completion
		-- Optionally, you can also map these to your liking:
		-- ["<C-n>"] = { "select_next", "fallback" },
		-- ["<C-p>"] = { "select_prev", "fallback" },
		-- ["<C-y>"] = { "accept", "fallback" },
	},
})
