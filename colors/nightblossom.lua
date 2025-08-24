-- Clear existing highlights and reset syntax to default
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end

-- Set the name of the colorscheme so other plugins can detect it
vim.g.colors_name = "nightblossom"

-- Load the Lua-based theme with default spring variant
require("nightblossom").load("spring")
