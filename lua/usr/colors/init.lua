local M = {}

local force_background_transparency = function ()
    if niscolas.colorscheme.use_transparency then
        vim.api.nvim_set_hl(0, "Normal", {bg = "none", ctermbg = "none"})
        vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none", ctermbg = "none"})
    end
end

M.before_plugin = function()
    local colorscheme_name = niscolas.colorscheme.name
    local colorscheme_module_path = "colors.schemes." .. colorscheme_name
    local colorscheme_config_ok, colorscheme_config = try_usr_require(colorscheme_module_path)

    if colorscheme_config_ok then
        niscolas.colorscheme.config = colorscheme_config
    end

    if niscolas.colorscheme.config then
        niscolas.colorscheme.config.before_plugin()
    end
end

M.after_plugin = function()
    local colorscheme_plugin_ok, _ = try_require(niscolas.colorscheme.plugin_name)

    if colorscheme_plugin_ok then
        vim.cmd.colorscheme(niscolas.colorscheme.name)
    end

    force_background_transparency()

    if niscolas.colorscheme.config then
        niscolas.colorscheme.config.after_plugin()
    end
end

return M
