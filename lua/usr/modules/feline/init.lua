local usr_feline_util = usr_module_require("feline.util")

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

local feline = require("feline")

feline.setup({
    theme = usr_feline_util.theme,
    vi_mode_colors = vi_mode_colors,
    components = require("usr.modules.feline.statusbar").components,
})

feline.winbar.setup({
    components = require("usr.modules.feline.winbar").components,
})
