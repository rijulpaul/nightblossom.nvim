local M = {}

-- Setup function for user configuration
function M.setup(opts)
	local config = require("nightblossom.config")
	config.setup(opts)
	return config.get()
end

-- Load the colorscheme with current configuration
function M.load(variant)
	local config = require("nightblossom.config")
	local palette = require("nightblossom.palette")

	-- If variant is provided, update configuration
	if variant then
		config.update({ variant = variant })
		palette.set_variant(variant)
	end

	-- Get the current palette with config for transparency
	local current_config = config.get()
	local p = palette.get_palette(current_config)

	local highlight_groups = {}

	-- Load the highlight groups
	highlight_groups = vim.tbl_deep_extend("force", highlight_groups, require("nightblossom.highlights").get_groups(p))

	-- Load the highlights for plugins
	highlight_groups = vim.tbl_deep_extend(
		"force",
		highlight_groups,
		require("nightblossom.groups").get_plugins(p, current_config.integrations)
	)

	local highlight_overrides = current_config.overrides.highlights

	-- Override and Highlight
	for group_name, group_opts in pairs(highlight_groups) do
		group_opts = highlight_overrides[group_name] or group_opts
		vim.api.nvim_set_hl(0, group_name, group_opts)
	end

	vim.g.terminal_color_0 = p.ansi_black
	vim.g.terminal_color_1 = p.red
	vim.g.terminal_color_2 = p.green
	vim.g.terminal_color_3 = p.yellow
	vim.g.terminal_color_4 = p.cyan
	vim.g.terminal_color_5 = p.pink
	vim.g.terminal_color_6 = p.purple
	vim.g.terminal_color_7 = p.fg
	vim.g.terminal_color_8 = p.ansi_black -- Bright black
	vim.g.terminal_color_9 = p.red -- Bright red
	vim.g.terminal_color_10 = p.green -- Bright green
	vim.g.terminal_color_11 = p.yellow -- Bright yellow
	vim.g.terminal_color_12 = p.cyan -- Bright cyan
	vim.g.terminal_color_13 = p.pink -- Bright magenta
	vim.g.terminal_color_14 = p.purple -- Bright cyan
	vim.g.terminal_color_15 = p.fg -- Bright white

	-- Set colors_name to the variant for identification
	local variant_name = config.get().variant
	vim.g.colors_name = variant_name == "spring" and "nightblossom" or ("nightblossom-" .. variant_name)
end

-- Get available variants
function M.get_variants()
	local palette = require("nightblossom.palette")
	return palette.get_variants()
end

-- Switch variant programmatically
function M.set_variant(variant)
	local config = require("nightblossom.config")
	config.update({ variant = variant })
	M.load(variant)
end

-- Toggle transparency
function M.toggle_transparency()
	local config = require("nightblossom.config")
	local is_transparent = config.toggle_transparency()
	M.load() -- Reload with current variant
	return is_transparent
end

-- Set transparency
function M.set_transparency(enabled)
	local config = require("nightblossom.config")
	config.update({ transparent = enabled })
	M.load() -- Reload with current variant
	return enabled
end

-- Override system functions
function M.override_colors(color_overrides)
	local config = require("nightblossom.config")
	local result = config.override_colors(color_overrides)
	if result then
		M.load() -- Reload with current variant
	end
	return result
end

function M.override_highlights(highlight_overrides)
	local config = require("nightblossom.config")
	local result = config.override_highlights(highlight_overrides)
	if result then
		M.load() -- Reload with current variant
	end
	return result
end

function M.clear_color_overrides()
	local config = require("nightblossom.config")
	local result = config.clear_color_overrides()
	M.load() -- Reload with current variant
	return result
end

function M.clear_highlight_overrides()
	local config = require("nightblossom.config")
	local result = config.clear_highlight_overrides()
	M.load() -- Reload with current variant
	return result
end

function M.clear_all_overrides()
	local config = require("nightblossom.config")
	local result = config.clear_all_overrides()
	M.load() -- Reload with current variant
	return result
end

function M.get_color_overrides()
	local config = require("nightblossom.config")
	return config.get_color_overrides()
end

function M.get_highlight_overrides()
	local config = require("nightblossom.config")
	return config.get_highlight_overrides()
end

function M.get_palette()
	local palette = require("nightblossom.palette")
	return palette.get_palette()
end

return M
