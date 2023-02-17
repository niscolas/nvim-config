local M = {}

local force_background_transparency = function()
    if niscolas.theme.use_transparency then
        vim.api.nvim_set_hl(0, "Normal", { bg = "none", ctermbg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", ctermbg = "none" })
    end
end

local load_colorscheme = function()
    local colorscheme_ok, result =
        pcall(vim.cmd.colorscheme, niscolas.theme.name)
    return colorscheme_ok
end

M.colorscheme_module_path = nil

M.colorscheme_module = nil

M.before_plugin = function()
    local colorscheme_name = niscolas.theme.name
    M.colorscheme_module_path = "usr.themes." .. colorscheme_name
    _, M.colorscheme_module = pcall(require, M.colorscheme_module_path)

    if M.colorscheme_module and M.colorscheme_module.before_plugin then
        M.colorscheme_module.before_plugin()
    end
end

M.after_plugin = function()
    load_colorscheme()
    force_background_transparency()

    if M.colorscheme_module and M.colorscheme_module.after_plugin then
        M.colorscheme_module.after_plugin()
    end
end

M.try_get_member = function(member_name)
    if not M.colorscheme_module then
        return false, nil
    end

    local member = M.colorscheme_module[member_name]
    return member ~= nil, member
end

return M
