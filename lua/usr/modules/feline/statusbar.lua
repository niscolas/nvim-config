local usr_feline_util = usr_module_require("feline.util")

local M = {}

M.components = {
    active = { {}, {}, {} },
    inactive = { {}, {}, {} },
}

M.components.active[1][1] = usr_module_require("feline.components.vi_mode")

M.components.active[1][2] = {
    provider = "git_branch",
    hl = {
        fg = "yellow",
        style = "bold"
    }
}

M.components.active[1][3] = {
    provider = "git_diff_added",
    hl = {
        fg = "green",
        style = "bold"
    }
}

M.components.active[1][4] = {
    provider = "git_diff_changed",
    hl = {
        fg = "orange",
        style = "bold"
    }
}

M.components.active[1][5] = {
    provider = "git_diff_removed",
    hl = {
        fg = "red",
        style = "bold"
    },
}

M.components.active[3][1] = require(
    "usr.modules.feline.components.file_info")

M.components.active[3][2] = require(
    "usr.modules.feline.components.cursor_position")

return M
