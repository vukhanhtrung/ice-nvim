-- OpenCode plugin configuration for AI-assisted coding in Neovim

-- Automatically re-read files when changed externally, useful for AI edits
vim.o.autoread = true

-- Plugin installation and core setup
vim.pack.add({ "https://github.com/nickjvandyke/opencode.nvim" })
vim.g.opencode_opts = {}

-- Keybindings

-- <leader>at - Follow AGENT-TODO instruction in current buffer
vim.keymap.set({ "n", "x" }, "<leader>at", function()
	require("opencode").ask("@buffer: follow the AGENT-TODO")
end, { desc = "Follow AGENT-TODO instruction for buffer" })

-- <leader>aa - Ask opencode a custom question
vim.keymap.set({ "n", "x" }, "<leader>aa", function()
	require("opencode").ask("@this: ")
end, { desc = "Ask opencode…" })

-- <leader>as - Cycle through opencode options
vim.keymap.set({ "n", "x" }, "<leader>as", function()
	require("opencode").select()
end, { desc = "Cycle opencode…" })

-- <leader>ac - Select agent
vim.keymap.set({ "n", "x" }, "<leader>ac", function()
	require("opencode").command("agent.cycle")
end, { desc = "Select agent" })

-- <M-u> - Scroll opencode output up
vim.keymap.set("n", "<M-u>", function()
	require("opencode").command("session.half.page.up")
end, { desc = "Scroll opencode up" })

-- <M-d> - Scroll opencode output down
vim.keymap.set("n", "<M-d>", function()
	require("opencode").command("session.half.page.down")
end, { desc = "Scroll opencode down" })

-- <leader>ai - Interrupt opencode session
vim.keymap.set("n", "<leader>ai", function()
	require("opencode").command("session.interrupt")
end, { desc = "Interrupt opencode" })
