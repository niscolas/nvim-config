local M = {}

local force_background_transparency = function()
    if not niscolas.theme.use_transparency then
        return
    end

    set_hl(0, "Normal", { bg = "none", ctermbg = "none" })
    set_hl(0, "NormalFloat", { bg = "none", ctermbg = "none" })
    set_hl(0, "NormalNC", { bg = "none", ctermbg = "none" })
end

local try_load_colorscheme = function()
    local colorscheme_ok, _ = pcall(cmd.colorscheme, niscolas.theme.colorscheme)
    return colorscheme_ok
end

M.theme_mod = nil

M.before_plugin = function()
    local theme_modname = "usr.themes." .. niscolas.theme.modname
    M.theme_mod = require(theme_modname)

    if M.theme_mod then
        M.theme_mod.before_plugin()
    end
end

M.after_plugin = function()
    if M.theme_mod then
        M.theme_mod.after_plugin()
    end

    try_load_colorscheme()
    force_background_transparency()

    if M.theme_mod then
        M.theme_mod.after_colorscheme()
    end
end

M.get_field = function(field_name)
    if not M.theme_mod then
        return nil
    end

    local result = M.theme_mod[field_name]
    return result
end

return M
