local usr_feline_util = require("usr.modules.feline.util")
local usr_git_component = require("usr.modules.feline.components.core.git")
local usr_lsp_component = require("usr.modules.feline.components.core.lsp")

local M = {}

M.components = {}

local raw_components = {
    active = {
        {
            { require("usr.modules.feline.components.core.mode"), },
            {
                require("usr.modules.feline.components.core.navic"),
                require("usr.modules.feline.components.visual.default_bg"),
            },
            { usr_git_component.branch, },
            { usr_git_component.diff_added, },
            { usr_git_component.diff_changed, },
            { usr_git_component.diff_removed, },
        },
        {
            { usr_lsp_component.client_names, },
            { usr_lsp_component.diagnostic_errors, },
            { usr_lsp_component.diagnostic_warnings, },
            { usr_lsp_component.diagnostic_info, },
            { usr_lsp_component.diagnostic_hints, },
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
