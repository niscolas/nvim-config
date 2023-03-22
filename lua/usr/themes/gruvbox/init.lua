local M = {}

M.contrast = "soft"

M.get_colors = function()
    local result =
        require("gruvbox.palette").get_base_colors(vim.o.background, M.contrast)

    result.bg = result.bg0
    result.fg = result.fg0
    return result
end

M.before_plugin = function() end

M.after_plugin = function()
    require("gruvbox").setup {
        contrast = M.contrast,
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = true,
    }
end

M.after_colorscheme = function()
    local colors = M.get_colors()
    set_hl(0, "FloatBorder", { fg = colors.yellow })
end

M.cmp_setup_hl = function()
    require("usr.themes.gruvbox.cmp").setup_hl()
end

M.feline_setup = function()
    require("usr.themes.gruvbox.feline").setup()
end

M.fzf_lua_get_fzf_colors = function()
    return require("usr.themes.gruvbox.fzf_lua").get_fzf_colors()
end

M.fzf_lua_get_hl = function()
    return require("usr.themes.gruvbox.fzf_lua").hl
end

M.navic_setup_hl = function()
    require("usr.themes.gruvbox.navic").setup_hl()
end

M.noice_setup_hl = function() end

return M
