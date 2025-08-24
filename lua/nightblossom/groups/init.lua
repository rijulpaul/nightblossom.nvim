local plugins = {
	-- List of supported plugins
	"treesitter",
	"telescope",
	"nvim-cmp",
}

local M = {}

function M.get_plugins(p, config)
	local palette = {}

	-- Load highlights for each plugin enabled or not mentioned
	for _, plugin in ipairs(plugins) do
		if config[plugin] == nil or config[plugin] == true then
			palette = vim.tbl_deep_extend("force", palette, require("nightblossom.groups." .. plugin).get(p))
		end
	end

	return palette
end

return M
