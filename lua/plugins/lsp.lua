vim.pack.add({ "https://github.com/neovim/nvim-lspconfig", "https://github.com/WieeRd/auto-lsp.nvim" })
-- vim.lsp.enable("lua_ls")
-- vim.lsp.enable("nim_langserver")
--
vim.lsp.config("rust_analyzer", {
	settings = {
		["rust-analyzer"] = {
			check = {
				command = "clippy",
			},
		},
	},
})
require("auto-lsp").setup()
