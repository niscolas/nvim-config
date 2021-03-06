local usr_feline_util = require("usr.modules.feline.util")

local M = {}

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

M.config = function()
    local feline_ok, feline = pcall(require, "feline")

    if not feline_ok then
        return
    end

    require("feline").setup({
        theme = usr_feline_util.theme,
        vi_mode_colors = vi_mode_colors,
        components = require("usr.modules.feline.statusbar").components,
    })

    require("feline").winbar.setup({
        components = require("usr.modules.feline.winbar").components,
    })
end

return M
