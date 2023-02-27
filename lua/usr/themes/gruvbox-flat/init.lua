local M = {}

M.colors = {}

M.before_plugin = function()
    vim.g.gruvbox_italic_functions = true
    vim.g.gruvbox_transparent = true

    local gruvbox_colors_ok, gruvbox_colors = pcall(require, "gruvbox.colors")
    if gruvbox_colors_ok then
        M.colors = gruvbox_colors.setup {}
    end
end

M.after_plugin = function()
    set_hl(0, "FloatBorder", { fg = M.colors.yellow })
end

M.noice_setup_hls = function()
    set_hl(0, "NoicePopupBorder", { fg = M.colors.yellow })
end

M.fzf_lua_setup_hls = function()
    set_hl(0, "FzfLuaNormal", { link = "Function" })
    set_hl(0, "FzfLuaBorder", { link = "Function" })
    set_hl(0, "FzfLuaCursor", { link = "Function" })
    set_hl(0, "FzfLuaCursorLine", { link = "CursorLine" })
    set_hl(0, "FzfLuaCursorLineNr", { link = "CursorLineNr" })
    set_hl(0, "FzfLuaSearch", { link = "IncSearch" })
    set_hl(0, "FzfLuaTitle", { link = "FzfLuaNormal" })
    set_hl(0, "FzfLuaScrollBorderEmpty", { link = "FzfLuaBorder" })
    set_hl(0, "FzfLuaScrollBorderFull", { link = "FzfLuaBorder" })
    set_hl(0, "FzfLuaScrollFloatEmpty", { link = "PmenuSbar" })
    set_hl(0, "FzfLuaScrollFloatFull", { link = "PmenuThumb" })
    set_hl(0, "FzfLuaHelpNormal", { link = "FzfLuaNormal" })
    set_hl(0, "FzfLuaHelpBorder", { link = "FzfLuaBorder" })
end

M.fzf_lua_fzf_colors = {
    ["fg"] = { "fg", "CursorLine" },
    ["bg"] = { "bg", "Normal" },
    ["hl"] = { "fg", "Comment" },
    ["fg+"] = { "fg", "Normal" },
    ["bg+"] = { "bg", "CursorLine" },
    ["hl+"] = { "fg", "Statement" },
    ["info"] = { "fg", "PreProc" },
    ["prompt"] = { "fg", "Conditional" },
    ["pointer"] = { "fg", "Exception" },
    ["marker"] = { "fg", "Keyword" },
    ["spinner"] = { "fg", "Label" },
    ["header"] = { "fg", "Comment" },
    ["gutter"] = { "bg", "blue" },
}

M.navic_setup_highlight = require("usr.themes.gruvbox-flat.navic").setup_hl

return M
