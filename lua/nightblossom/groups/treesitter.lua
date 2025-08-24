local M = {}

function M.get(p, config)
	local group = {

		-- Variables
		["@variable"]                   = { fg = p.cyan },
		["@variable.builtin"]           = { fg = p.cyan },
		["@variable.parameter"]         = { fg = p.cyan },
		["@variable.parameter.builtin"] = { fg = p.cyan },
		["@variable.member"]            = { fg = p.fg },

		-- Constants
		["@constant"]                   = { fg = p.cyan },
		["@constant.builtin"]           = { fg = p.magenta },
		["@constant.macro"]             = { fg = p.purple },

		-- Modules
		["@module"]                     = { fg = p.cyan },
		["@module.builtin"]             = { fg = p.cyan },

		-- Labels
		["@label"]                      = { fg = p.magenta },

		-- Strings
		["@string"]                     = { fg = p.peach },
		["@string.documentation"]       = { fg = p.fg_dim },
		["@string.regexp"]              = { fg = p.purple },
		["@string.escape"]              = { fg = p.purple },
		["@string.special"]             = { fg = p.purple },
		["@string.special.symbol"]      = { fg = p.purple },
		["@string.special.path"]        = { fg = p.peach },
		["@string.special.url"]         = { fg = p.peach, underline = true },

		-- Characters
		["@character"]                  = { fg = p.peach },
		["@character.special"]          = { fg = p.purple },

		-- Booleans & Numbers
		["@boolean"]                    = { fg = p.coral },
		["@number"]                     = { fg = p.coral },
		["@number.float"]               = { fg = p.coral },

		-- Types
		["@type"]                       = { fg = p.pink },
		["@type.builtin"]               = { fg = p.pink },
		["@type.definition"]            = { fg = p.pink },

		-- Attributes / Annotations
		["@attribute"]                  = { fg = p.peach },
		["@attribute.builtin"]          = { fg = p.peach },

		-- Properties / Fields
		["@property"]                   = { fg = p.cyan },

		-- Functions
		["@function"]                   = { fg = p.purple },
		["@function.builtin"]           = { fg = p.purple },
		["@function.call"]              = { fg = p.purple },
		["@function.macro"]             = { fg = p.purple },
		["@function.method"]            = { fg = p.purple },
		["@function.method.call"]       = { fg = p.purple },

		-- Constructors
		["@constructor"]                = { fg = p.pink },

		-- Operators
		["@operator"]                   = { fg = p.pink },

		-- Keywords
		["@keyword"]                    = { fg = p.magenta },
		["@keyword.coroutine"]          = { fg = p.magenta },
		["@keyword.function"]           = { fg = p.pink },
		["@keyword.operator"]           = { fg = p.pink },
		["@keyword.import"]             = { fg = p.magenta },
		["@keyword.type"]               = { fg = p.magenta },
		["@keyword.modifier"]           = { fg = p.magenta },
		["@keyword.repeat"]             = { fg = p.magenta },
		["@keyword.return"]             = { fg = p.magenta },
		["@keyword.debug"]              = { fg = p.magenta },
		["@keyword.exception"]          = { fg = p.magenta },
		["@keyword.conditional"]        = { fg = p.magenta },
		["@keyword.conditional.ternary"] = { fg = p.magenta },
		["@keyword.directive"]          = { fg = p.pink },
		["@keyword.directive.define"]   = { fg = p.magenta },

		-- Punctuation
		["@punctuation.delimiter"]      = { fg = p.pink },
		["@punctuation.bracket"]        = { fg = p.magenta },
		["@punctuation.special"]        = { fg = p.purple },

		-- Comments
		["@comment"]                    = { fg = p.fg_dim },
		["@comment.error"]              = { fg = p.red, bold = true },
		["@comment.warning"]            = { fg = p.yellow, bold = true },
		["@comment.todo"]               = { fg = p.pink, bold = true },
		["@comment.note"]               = { fg = p.cyan, bold = true },

		-- Markup
		["@markup.strong"]              = { bold = true },
		["@markup.italic"]              = { italic = true },
		["@markup.strikethrough"]       = { strikethrough = true },
		["@markup.underline"]           = { underline = true },
		["@markup.heading"]             = { fg = p.pink, bold = true },
		["@markup.heading.1"]           = { fg = p.pink, bold = true },
		["@markup.heading.2"]           = { fg = p.pink, bold = true },
		["@markup.heading.3"]           = { fg = p.pink, bold = true },
		["@markup.heading.4"]           = { fg = p.pink, bold = true },
		["@markup.heading.5"]           = { fg = p.pink, bold = true },
		["@markup.heading.6"]           = { fg = p.pink, bold = true },
		["@markup.quote"]               = { fg = p.fg_dim, italic = true },
		["@markup.math"]                = { fg = p.coral },
		["@markup.link"]                = { fg = p.peach, underline = true },
		["@markup.link.label"]          = { fg = p.cyan },
		["@markup.link.url"]            = { fg = p.peach, underline = true },
		["@markup.raw"]                 = { fg = p.fg },
		["@markup.raw.block"]           = { fg = p.fg },
		["@markup.list"]                = { fg = p.fg_dim },
		["@markup.list.checked"]        = { fg = p.green },
		["@markup.list.unchecked"]      = { fg = p.fg_dim },

		-- Diff
		["@diff.plus"]                  = { fg = p.green },
		["@diff.minus"]                 = { fg = p.red },
		["@diff.delta"]                 = { fg = p.pink },

		-- Tags (HTML/XML)
		["@tag"]                        = { fg = p.magenta },
		["@tag.builtin"]                = { fg = p.pink },
		["@tag.attribute"]              = { fg = p.cyan },
		["@tag.delimiter"]              = { fg = p.fg_dim },
	}
	return group
end

return M
