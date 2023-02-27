local M = {}

local force_background_transparency = function()
    if niscolas.theme.use_transparency then
        set_hl(0, "Normal", { bg = "none", ctermbg = "none" })
        set_hl(0, "NormalFloat", { bg = "none", ctermbg = "none" })
    end
end

local load_theme = function()
    local theme_ok, result = pcall(cmd.colorscheme, niscolas.theme.name)
    return theme_ok
end

M.theme_module_path = nil

M.theme_module = nil

M.before_plugin = function()
    force_background_transparency()

    local theme_name = niscolas.theme.name
    M.theme_module_path = "usr.themes." .. theme_name
    _, M.theme_module = pcall(require, M.theme_module_path)

    if M.theme_module and M.theme_module.before_plugin then
        M.theme_module.before_plugin()
    end
end

M.after_plugin = function()
    load_theme()

    if M.theme_module and M.theme_module.after_plugin then
        M.theme_module.after_plugin()
    end

    force_background_transparency()
end

M.try_get_member = function(member_name)
    if not M.theme_module then
        return false, nil
    end

    local member = M.theme_module[member_name]
    return member ~= nil, member
end

return M
