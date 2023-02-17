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

M.space_separators = {
    left_sep = {
        str = " ",
    },
    right_sep = {
        str = " ",
    },
}

M.default_separators = {
    left_sep = {
        str = " ",
    },
    right_sep = {
        str = " ",
    },
}

M.setup = function()
    local colors = require("usr.themes.gruvbox-flat").colors
    -- colors.bg = "#32302f"

    feline.setup {
        theme = colors,
        vi_mode_colors = M.vi_mode_colors,
        components = require(
            "usr.modules.feline.themes.gruvbox-flat.statusbar"
        ).components,
        force_inactive = {},
    }

    feline.winbar.setup {
        theme = colors,
        components = require("usr.modules.feline.themes.gruvbox-flat.winbar").components,
        force_inactive = {},
    }
end

return M
