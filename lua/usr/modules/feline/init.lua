local usr_feline_util = require("usr.modules.feline.util")

local M = {}

local force_inactive = {
    filetypes = {
        "NvimTree",
        "dbui",
        "packer",
        "startify",
        "fugitive",
        "fugitiveblame"
    },
    buftypes = {
        "terminal"
    },
    bufnames = {}
}

local vi_mode_colors = {
    NORMAL = "green",
    OP = "green",
    INSERT = "red",
    CONFIRM = "red",
    VISUAL = "skyblue",
    LINES = "skyblue",
    BLOCK = "skyblue",
    REPLACE = "violet",
    ["V-REPLACE"] = "violet",
    ENTER = "cyan",
    MORE = "cyan",
    SELECT = "orange",
    COMMAND = "green",
    SHELL = "green",
    TERM = "green",
    NONE = "yellow"
}

M.setup = function()
    require("feline").setup({
        theme = usr_feline_util.theme,
        vi_mode_colors = vi_mode_colors,
        components = require("usr.modules.feline.statusbar").components,
        force_inactive = force_inactive,
    })

    require("feline").winbar.setup({
        components = require("usr.modules.feline.winbar").components,
        force_inactive = force_inactive,
    })
end

return M
