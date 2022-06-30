local usr_feline_util = require("usr.modules.feline.util")

local M = {}

M.components = {
    active = { {}, {}, {} },
    inactive = { {}, {}, {} },
}

M.components.active[1][1] = require(
    "usr.modules.feline.components.vi_mode")

M.components.active[1][2] = require(
    "usr.modules.feline.components.aerial")

M.components.active[2][1] = {
    provider = "git_branch",
    hl = {
        fg = "yellow",
        style = "bold"
    }
}

M.components.active[2][2] = {
    provider = "git_diff_added",
    hl = {
        fg = "green",
        style = "bold"
    }
}

M.components.active[2][3] = {
    provider = "git_diff_changed",
    hl = {
        fg = "orange",
        style = "bold"
    }
}

M.components.active[2][4] = {
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
