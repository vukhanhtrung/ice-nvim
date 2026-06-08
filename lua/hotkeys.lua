vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "ga", "<C-^>zz", { desc = "Switch to alternative file, centered" })
vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "LSP Rename" })
vim.keymap.set("n", "<leader>K", vim.diagnostic.open_float, { desc = "Diagnostic Hover" })
-- Clear search highlighting with double escape
vim.keymap.set("n", "<esc><esc>", function()
	vim.cmd("nohlsearch")
	return "<esc>"
end, { expr = true, desc = "Clear search highlights" })
-- [[Custom Hotkeys]]
vim.keymap.set({ "v", "n" }, "<leader>t", "<cmd>sp +term<cr>", { desc = "Split Terminal Horizonally" })

-- REPLACED BY PLUGINS
-- vim.keymap.set("n", "=", function() vim.lsp.buf.format({ async = true }) end, { buffer = true, desc = "Format Document" })
