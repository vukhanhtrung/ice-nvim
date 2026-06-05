local folder = "plugins"
local path = vim.fn.stdpath("config") .. "/lua/" .. folder
if vim.fn.isdirectory(path) == 0 then
	return
end
for _, file in ipairs(vim.fn.readdir(path)) do
	if file:match("%.lua$") then
		local name = file:gsub("%.lua$", "")
		require(folder .. "." .. name)
	end
end
