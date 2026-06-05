vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })

require("gitsigns").setup()

-- Keymaps (add these)
vim.keymap.set("n", "<leader>gb", function()
	require("gitsigns").blame_line()
end, { desc = "Git blame" })
vim.keymap.set("n", "<leader>gp", function()
	require("gitsigns").preview_hunk()
end, { desc = "Preview hunk" })
vim.keymap.set("n", "<leader>gh", function()
	require("gitsigns").toggle_current_line_blame()
end, { desc = "Toggle line blame" })
--asdf
