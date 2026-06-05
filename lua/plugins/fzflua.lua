if vim.fn.executable("fzf") == 0 then
	vim.notify(
		"fzflua.lua: Fzf binary not found. Please install it:\n",
		vim.log.levels.ERROR,
		{ title = "fzflua.lua", timeout = 5000 }
	)
	return
end
vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/ibhagwan/fzf-lua",
})
-- =====================
-- FZF (fzf-lua) pickers
-- =====================
local fzf = require("fzf-lua")

vim.keymap.set("n", "<leader>fp", "<cmd>FzfLua<CR>", { desc = "Open Fzf Prompt" })
vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<CR>")
vim.keymap.set("n", "<leader><leader>", "<cmd>FzfLua files<CR>")
vim.keymap.set("n", "<leader>/", "<cmd>FzfLua live_grep<CR>")
vim.keymap.set("n", "<Leader>fd", fzf.diagnostics_document, { desc = "Fzf Diagnostics Buffer" })
vim.keymap.set("n", "<Leader>fD", fzf.diagnostics_workspace, { desc = "Fzf Diagnostics Project" })
vim.keymap.set("n", "<Leader>fs", fzf.lsp_document_symbols, { desc = "Fzf Document Symbols" })
vim.keymap.set("n", "<Leader>fS", fzf.lsp_workspace_symbols, { desc = "Fzf Workspace Symbols" })
vim.keymap.set("n", "<Leader>fr", fzf.lsp_references, { desc = "Fzf References" })
vim.keymap.set("n", "<leader>ca", "<cmd>FzfLua lsp_code_actions<CR>", { desc = "Fzf Code Actions" })

-- =====================
-- List commands (quickfix/loclist)
-- =====================
vim.keymap.set("n", "<Leader>ld", vim.diagnostic.setloclist, { desc = "List Diagnostics Buffer" })
vim.keymap.set("n", "<Leader>lD", vim.diagnostic.setqflist, { desc = "List Diagnostics Project" })
vim.keymap.set("n", "<Leader>ls", vim.lsp.buf.document_symbol, { desc = "List Document Symbols" })
vim.keymap.set("n", "<Leader>lS", vim.lsp.buf.workspace_symbol, { desc = "List Workspace Symbols" })
vim.keymap.set("n", "<Leader>lr", vim.lsp.buf.references, { desc = "List References" })
