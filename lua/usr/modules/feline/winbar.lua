local usr_feline_util = require("usr.modules.feline.util")

local M = {}

M.components = {}

local raw_components = {
    active = {
        {
            { require("usr.modules.feline.components.core.empty") }
        },
        {
            { require("usr.modules.feline.components.core.file_path") },
        },
        {},
    },
    inactive = {
        {},
        {
            { require("usr.modules.feline.components.core.file_path") },
        },
        {},
    }
}

M.components.active = usr_feline_util.process_component_sections(raw_components.active)
M.components.inactive = usr_feline_util.process_component_sections(raw_components.inactive)

return M
