if vim.fn.executable("yazi") == 0 then
	vim.notify(
		"nvim-yazi.lua Yazi binary not found. Please install it:\n",
		vim.log.levels.ERROR,
		{ title = "yazi.nvim", timeout = 5000 }
	)
	return
end

vim.pack.add({
	"https://github.com/mikavilpas/yazi.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
})

require("yazi").setup({
	-- Open yazi instead of netrw for directories (optional)
	open_for_directories = false,

	-- Transparency of the floating window (0-100)
	yazi_floating_window_winblend = 0,

	yazi_floating_window_border = "rounded",
})

-- Keymaps
vim.keymap.set("n", "<leader>e", "<cmd>Yazi<CR>", { desc = "Open yazi at current file" })
vim.keymap.set("n", "<leader>E", "<cmd>Yazi cwd<CR>", { desc = "Open yazi at working directory" })
