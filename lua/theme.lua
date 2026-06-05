vim.pack.add({
	"https://github.com/catppuccin/nvim",
})
require("catppuccin").setup({
	flavour = "frappe", -- frappe, latte, macchiato, mocha
})

vim.cmd.colorscheme("catppuccin")
