local usr_feline_util = require("usr.modules.feline.util")

local M = {}

M.components = {}

local raw_components = {
    active = {
        {
            { require("usr.modules.feline.components.core.file_path") },
        },
        {
            {},
        },
        {
            {},
        },
    },
    inactive = {
        {
            { require("usr.modules.feline.components.core.file_path") },
        },
        {},
        {},
    }
}

--[[ M.components.inactive[1][1] = {
    hl = {
        bg = "white",
        fg = "black",
    },
    left_sep = {
        hl = {
            bg = "white",
        },
        str = " ",
    },
    provider = require("usr.modules.feline.components.aerial"),
    right_sep = {
        hl = {
            bg = usr_feline_util.theme.bg,
            fg = "white",
        },
        str = usr_feline_util.default_right_separator,
    }
} ]]

M.components.active = usr_feline_util.process_component_sections(raw_components.active)
M.components.inactive = usr_feline_util.process_component_sections(raw_components.inactive)

return M
