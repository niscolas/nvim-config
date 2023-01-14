local usr_feline_util = require("usr.modules.feline.util")

local M = {}

M.components = {}

local raw_components = {
    active = {
        {
            { require("usr.modules.feline.components.core.mode"), },
            { require("usr.modules.feline.components.core.navic"), },
            { require("usr.modules.feline.components.core.git").branch, },
            { require("usr.modules.feline.components.core.git").diff_added, },
            { require("usr.modules.feline.components.core.git").diff_changed, },
            { require("usr.modules.feline.components.core.git").diff_removed, },
        },
        {
            { require("usr.modules.feline.components.core.lsp").client_names, },
            { require("usr.modules.feline.components.core.lsp").diagnostic_errors, },
            { require("usr.modules.feline.components.core.lsp").diagnostic_warnings, },
            { require("usr.modules.feline.components.core.lsp").diagnostic_info, },
            { require("usr.modules.feline.components.core.lsp").diagnostic_hints, },
        },
        {
            { require("usr.modules.feline.components.core.file_info"), },
            { require("usr.modules.feline.components.core.file_cursor") }
        }
    },
    inactive = {}
}

M.components.active = usr_feline_util.process_component_sections(raw_components.active)
M.components.inactive = usr_feline_util.process_component_sections(raw_components.inactive)

return M
