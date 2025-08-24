-- Inspired by night-blossom VSCode theme by RustedTurnip
-- https://github.com/RustedTurnip/night-blossom

local variants = {}

-- Default spring variant
variants.spring = require("nightblossom.themes.nightblossom")
-- Sakura variant (cherry blossom inspired)
variants.sakura = require("nightblossom.themes.nightblossom-sakura")
-- Pastel variant (soft and gentle)
variants.pastel = require("nightblossom.themes.nightblossom-pastel")

local M = {}

-- Default to spring variant
M.current_variant = "spring"

-- Get palette for specific variant with transparency support
function M.get_palette(config)

	local variant = M.current_variant

	if config and config.variant then
		variant = config.variant
	end

	local palette

	if variants[variant] then
		palette = vim.tbl_deep_extend("force", {}, variants[variant])
	else
		vim.notify("Unknown variant '" .. variant .. "', falling back to 'spring'", vim.log.levels.WARN)
		palette = vim.tbl_deep_extend("force", {}, variants.spring)
	end

	-- Apply transparency if enabled
	if config and config.transparent then
		palette.bg = "NONE"
	end

	-- Apply color overrides if provided
	if config and config.overrides and config.overrides.colors then
		for color_name, color_value in pairs(config.overrides.colors) do
			if palette[color_name] ~= nil then
				palette[color_name] = color_value
			else
				vim.notify("Unknown color '" .. color_name .. "' in overrides", vim.log.levels.WARN)
			end
		end
	end

	return palette
end

-- Set current variant
function M.set_variant(variant)
	if variants[variant] then
		M.current_variant = variant
		return variants[variant]
	else
		vim.notify("Unknown variant '" .. variant .. "'", vim.log.levels.ERROR)
		return nil
	end
end

-- Get all available variants
function M.get_variants()
	return vim.tbl_keys(variants)
end

-- Return the module for proper function access
return M
