vim.pack.add({ "https://github.com/stevearc/conform.nvim" })
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback", -- This is correct and valid
	},
})
vim.keymap.set("n", "=", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
	print("conform formated!")
end, { buffer = true, desc = "Format Document Conform" })
