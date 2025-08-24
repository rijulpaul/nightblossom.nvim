local M = {}

function M.get(p)
	return {}
end

function M.options()
	local p = require("nightblossom.palette").get_palette()
	local config = require("nightblossom.config").get()
	if config.transparent then
		p.bg = nil
	end

	return {
		normal = {
			a = { fg = p.bg, bg = p.cyan, gui = "bold" },
			b = { fg = p.pink, bg = p.bg },
			c = { fg = p.pink, bg = p.bg },
		},
		insert = {
			a = { fg = p.bg, bg = p.coral, gui = "bold" },
			b = { fg = p.pink, bg = p.bg },
			c = { fg = p.pink, bg = p.bg },
		},
		replace = {
			a = { fg = p.bg, bg = p.purple, gui = "bold" },
			b = { fg = p.pink, bg = p.bg },
			c = { fg = p.pink, bg = p.bg },
		},
		visual = {
			a = { fg = p.bg, bg = p.purple, gui = "bold" },
			b = { fg = p.pink, bg = p.bg },
			c = { fg = p.pink, bg = p.bg },
		},
		command = {
			a = { fg = p.bg, bg = p.pink, gui = "bold" },
			b = { fg = p.pink, bg = p.bg },
			c = { fg = p.pink, bg = p.bg },
		},
		terminal = {
			a = { fg = p.bg, bg = p.grape, gui = "bold" },
			b = { fg = p.pink, bg = p.bg },
			c = { fg = p.pink, bg = p.bg },
		},
		inactive = {
			a = { fg = p.fg_dim, bg = p.bg_alt },
			b = { fg = p.fg_dim, bg = p.bg_alt },
			c = { fg = p.fg_dim, bg = p.bg },
		},
	}
end

return M
