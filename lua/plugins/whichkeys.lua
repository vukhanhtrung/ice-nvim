vim.pack.add({ "https://github.com/folke/which-key.nvim" })
local wk = require("which-key")
wk.setup({ preset = "modern", delay = 0 })
wk.add({
	{ "<leader>c", group = "Code" },
	{ "<leader>f", group = "Fzf" },
	{ "<leader>l", group = "List" },
})
