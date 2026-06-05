-- Use Yazi for now

vim.pack.add({ "https://github.com/echasnovski/mini.files" })
vim.keymap.set("n", "<leader>e", function()
	require("mini.files").open()
end, { desc = "Mini files explorer" })
