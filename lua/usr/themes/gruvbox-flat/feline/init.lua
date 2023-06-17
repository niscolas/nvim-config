local feline = require("feline")

local M = {}

M.vi_mode_colors = {
    NORMAL = "green",
    OP = "green",
    INSERT = "red",
    CONFIRM = "red",
    VISUAL = "blue",
    LINES = "blue",
    BLOCK = "blue",
    REPLACE = "purple",
    ["V-REPLACE"] = "purple",
    ENTER = "aqua",
    MORE = "aqua",
    SELECT = "orange",
    COMMAND = "blue",
    SHELL = "blue",
    TERM = "blue",
    NONE = "yellow",
}

M.default_left_sep = {
    str = "",
}

M.default_right_sep = {
    str = "",
}

M.default_seps = {
    left_sep = M.default_left_sep,
    right_sep = M.default_right_sep,
}

M.setup = function()
    local colors = require("usr.themes.gruvbox-flat").colors

    feline.setup {
        theme = colors,
        vi_mode_colors = M.vi_mode_colors,
        components = require(
            "usr.feline.themes.gruvbox-flat.statusbar"
        ).components,
        force_inactive = {},
    }

    feline.winbar.setup {
        theme = colors,
        components = require("usr.feline.themes.gruvbox-flat.winbar").components,
        force_inactive = {},
    }
end

return M
