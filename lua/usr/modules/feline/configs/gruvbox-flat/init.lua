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

M.setup = function()
    local colors = require("usr.colors.schemes.gruvbox-flat").colors
    colors.bg = "#32302f"

    feline.setup {
        theme = colors,
        vi_mode_colors = M.vi_mode_colors,
        components = require(
            "usr.modules.feline.configs.gruvbox-flat.statusbar"
        ).components,
        force_inactive = {},
    }

    feline.winbar.setup {
        theme = colors,
        components = require("usr.modules.feline.configs.gruvbox-flat.winbar").components,
        force_inactive = {},
    }
end

return M
