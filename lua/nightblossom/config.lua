local M = {}

-- Default configuration
M.defaults = {
	variant = "spring", -- Theme variant: "spring", "sakura", "pastel"
	transparent = false, -- Enable complete background transparency
	integrations = {
		-- Integrations toggle: treesitter = true,
	},
	-- Override system
	overrides = {
		colors = {}, -- Color overrides: { bg = "#000000", fg = "#ffffff", etc. }
		highlights = {}, -- Highlight overrides: { Normal = { bg = "#000000" }, etc. }
	},
}

-- Current configuration (starts with defaults)
M.options = vim.tbl_deep_extend("force", {}, M.defaults)

-- Setup function
function M.setup(opts)
	-- Merge user options with defaults
	M.options = vim.tbl_deep_extend("force", M.defaults, opts or {})

	-- Validate variant
	local palette = require("nightblossom.palette")
	local available_variants = palette.get_variants()

	if not vim.tbl_contains(available_variants, M.options.variant) then
		vim.notify(
			"Invalid variant '"
				.. M.options.variant
				.. "'. Available variants: "
				.. table.concat(available_variants, ", "),
			vim.log.levels.WARN
		)
		M.options.variant = "spring"
	end

	-- Set the variant in palette
	palette.set_variant(M.options.variant)

	return M.options
end

-- Get current configuration
function M.get()
	return M.options
end

-- Update configuration
function M.update(opts)
	M.options = vim.tbl_deep_extend("force", M.options, opts or {})
	return M.options
end

-- Toggle transparency
function M.toggle_transparency()
	M.options.transparent = not M.options.transparent
	return M.options.transparent
end

-- Override system functions
function M.override_colors(color_overrides)
	if type(color_overrides) == "table" then
		M.options.overrides.colors = vim.tbl_deep_extend("force", M.options.overrides.colors, color_overrides)
		return M.options.overrides.colors
	else
		vim.notify("Color overrides must be a table", vim.log.levels.ERROR)
		return nil
	end
end

function M.override_highlights(highlight_overrides)
	if type(highlight_overrides) == "table" then
		M.options.overrides.highlights =
			vim.tbl_deep_extend("force", M.options.overrides.highlights, highlight_overrides)
		return M.options.overrides.highlights
	else
		vim.notify("Highlight overrides must be a table", vim.log.levels.ERROR)
		return nil
	end
end

function M.clear_color_overrides()
	M.options.overrides.colors = {}
	return M.options.overrides.colors
end

function M.clear_highlight_overrides()
	M.options.overrides.highlights = {}
	return M.options.overrides.highlights
end

function M.clear_all_overrides()
	M.options.overrides.colors = {}
	M.options.overrides.highlights = {}
	return M.options.overrides
end

-- Get current overrides
function M.get_color_overrides()
	return M.options.overrides.colors
end

function M.get_highlight_overrides()
	return M.options.overrides.highlights
end

return M
