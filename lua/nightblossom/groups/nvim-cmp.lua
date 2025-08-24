local M = {}

function M.get(p)
	local group = {
		CmpItemAbbr = { fg = p.fg },
		CmpItemAbbrDeprecated = { fg = p.fg_dim, strikethrough = true },
		CmpItemAbbrMatch = { fg = p.fg, bold = true },
		CmpItemKind = { fg = p.peach },
		CmpItemKindClass = { fg = p.magenta },
		CmpItemKindConstant = { fg = p.magenta },
		CmpItemKindConstructor = { fg = p.grape },
		CmpItemKindEnum = { fg = p.grape },
		CmpItemKindEnumMember = { fg = p.purple },
		CmpItemKindEvent = { fg = p.magenta },
		CmpItemKindField = { fg = p.cyan },
		CmpItemKindFile = { fg = p.pink },
		CmpItemKindFolder = { fg = p.peach },
		CmpItemKindFunction = { fg = p.purple },
		CmpItemKindInterface = { fg = p.grape },
		CmpItemKindKeyword = { fg = p.magenta },
		CmpItemKindMethod = { fg = p.purple },
		CmpItemKindModule = { fg = p.cyan },
		CmpItemKindOperator = { fg = p.pink },
		CmpItemKindProperty = { fg = p.cyan },
		CmpItemKindReference = { fg = p.purple },
		CmpItemKindSnippet = { fg = p.purple },
		CmpItemKindStruct = { fg = p.pink },
		CmpItemKindText = { fg = p.pink },
		CmpItemKindTypeParameter = { fg = p.cyan },
		CmpItemKindUnit = { fg = p.coral },
		CmpItemKindValue = { fg = p.pink },
		CmpItemKindVariable = { fg = p.cyan },
	}
	return group
end

return M
