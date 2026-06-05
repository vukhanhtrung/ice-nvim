vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})
-- Auto-cd to project root (parent of .git, not .git itself)
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		-- Get LSP client that just attached
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client.workspace_folders then
			local root = client.workspace_folders[1].name
			if root and root ~= "" then
				vim.cmd("cd " .. root)
			end
		end
	end,
})
