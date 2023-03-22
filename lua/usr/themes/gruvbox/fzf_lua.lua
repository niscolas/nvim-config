local M = {}

M.hl = {
    normal = "Normal", -- window normal color (fg+bg)
    border = "FloatBorder", -- border color
    help_normal = "Normal", -- <F1> window normal
    help_border = "FloatBorder", -- <F1> window border
    cursor = "Cursor", -- cursor highlight (grep/LSP matches)
    cursorline = "CursorLine", -- cursor line
    cursorlinenr = "CursorLineNr", -- cursor line number
    search = "IncSearch", -- search matches (ctags|help)
    title = "Normal", -- preview border title (file/buffer)
    scrollfloat_e = "PmenuSbar", -- scrollbar "empty" section highlight
    scrollfloat_f = "PmenuThumb", -- scrollbar "full" section highlight
    scrollborder_e = "FloatBorder", -- scrollbar "empty" section highlight
    scrollborder_f = "FloatBorder", -- scrollbar "full" section highlight
}

M.get_fzf_colors = function()
    return {
        -- ["fg"] = { "fg", "red" },
        -- ["bg"] = { "bg", "red" },
        -- ["hl"] = { "fg", "red" },
        -- ["fg+"] = { "fg", "red" },
        -- ["bg+"] = { "bg", "red" },
        -- ["hl+"] = { "fg", "red" },
        -- ["info"] = { "fg", "red" },
        -- ["prompt"] = { "fg", "red" },
        -- ["pointer"] = { "fg", "red" },
        -- ["marker"] = { "fg", "red" },
        -- ["spinner"] = { "fg", "Label" },
        -- ["header"] = { "fg", "red" },
        -- ["gutter"] = { "bg", "FzfLuaGutter" },
    }
end

return M
