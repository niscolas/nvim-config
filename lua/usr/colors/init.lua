local M = {}

local force_background_transparency = function()
    if niscolas.colorscheme.use_transparency then
        vim.api.nvim_set_hl(0, "Normal", { bg = "none", ctermbg = "none" })
        -- vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none", ctermbg = "none"})
    end
end

local load_colorscheme = function()
    local colorscheme_ok, result =
        pcall(vim.cmd.colorscheme, niscolas.colorscheme.name)
    return colorscheme_ok
end

M.colorscheme_module_path = nil

M.before_plugin = function()
    local colorscheme_name = niscolas.colorscheme.name
    M.colorscheme_module_path = "usr.colors.schemes." .. colorscheme_name
    print(M.colorscheme_module_path)
    local colorscheme_config_ok, colorscheme_config =
        try_require(M.colorscheme_module_path)

    if colorscheme_config_ok then
        niscolas.colorscheme.config = colorscheme_config
    end

    if
        niscolas.colorscheme.config
        and niscolas.colorscheme.config.before_plugin
    then
        niscolas.colorscheme.config.before_plugin()
    end
end

M.after_plugin = function()
    load_colorscheme()
    force_background_transparency()

    if
        niscolas.colorscheme.config and niscolas.colorscheme.config.after_plugin
    then
        niscolas.colorscheme.config.after_plugin()
    end
end

M.load_colors_for = function(target)
    if M.colorscheme_module_path then
        try_require(M.colorscheme_module_path .. "." .. target)
    end
end

return M
