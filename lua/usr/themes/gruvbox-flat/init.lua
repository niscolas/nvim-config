local M = {}

M.colors = {}

M.before_plugin = function()
    g.gruvbox_italic_functions = true
    g.gruvbox_transparent = true

    local gruvbox_colors_ok, gruvbox_colors = pcall(require, "gruvbox.colors")
    if gruvbox_colors_ok then
        M.colors = gruvbox_colors.setup {}
    end
end

M.after_plugin = function()
    set_hl(0, "FloatBorder", { fg = M.colors.yellow })
end

M.noice_setup_hl = function()
    set_hl(0, "NoicePopupBorder", { fg = M.colors.yellow })
end

M.fzf_lua_setup_hls = require("usr.themes.gruvbox-flat.fzf_lua").setup_hls

M.fzf_lua_fzf_colors = require("usr.themes.gruvbox-flat.fzf_lua").fzf_colors

M.navic_setup_hl = require("usr.themes.gruvbox-flat.navic").setup_hl

M.cmp_setup_hl = require("usr.themes.gruvbox-flat.cmp").setup_hl

return M
