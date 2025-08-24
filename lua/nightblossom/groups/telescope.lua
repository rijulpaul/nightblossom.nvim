local M = {}

function M.get(p)
	local group = {
		TelescopeBorder = { fg = p.pink },
		TelescopeNormal = { fg = p.fg_dim },
		TelescopePreviewNormal = { fg = p.fg },
		TelescopeTitle = { fg = p.pink },
		TelescopePromptPrefix = { fg = p.pink },
		TelescopePromptNormal = { fg = p.fg },
		TelescopeSelection = { fg = p.pink, bg = p.bg_alt },
		TelescopeSelectionCaret = { fg = p.pink },
		TelescopeMultiSelection = { fg = p.purple },
		TelescopeMultiIcon = { fg = p.pink },
		TelescopeMatching = { fg = p.magenta, bold = true },
	}
	return group
end

return M
