local M = {}

M.setup_hls = function()
    -- set_hl(0, "FzfLuaNormal", { link = "Function" })
    -- set_hl(0, "FzfLuaBorder", { link = "Function" })
    -- set_hl(0, "FzfLuaCursor", { link = "Function" })
    -- set_hl(0, "FzfLuaCursorLine", { link = "CursorLine" })
    -- set_hl(0, "FzfLuaCursorLineNr", { link = "CursorLineNr" })
    -- set_hl(0, "FzfLuaSearch", { link = "IncSearch" })
    -- set_hl(0, "FzfLuaTitle", { link = "FzfLuaNormal" })
    -- set_hl(0, "FzfLuaScrollBorderEmpty", { link = "FzfLuaBorder" })
    -- set_hl(0, "FzfLuaScrollBorderFull", { link = "FzfLuaBorder" })
    -- set_hl(0, "FzfLuaScrollFloatEmpty", { link = "PmenuSbar" })
    -- set_hl(0, "FzfLuaScrollFloatFull", { link = "PmenuThumb" })
    -- set_hl(0, "FzfLuaHelpNormal", { link = "FzfLuaNormal" })
    -- set_hl(0, "FzfLuaHelpBorder", { link = "FzfLuaBorder" })
end

M.fzf_colors = {
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

return M
