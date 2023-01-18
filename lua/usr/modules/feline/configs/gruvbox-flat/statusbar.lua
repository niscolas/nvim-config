local usr_feline_util = require("usr.modules.feline.util")
local usr_git_component = require("usr.modules.feline.components.core.git")
local usr_lsp_component = require("usr.modules.feline.components.core.lsp")
local usr_navic_component = require("usr.modules.feline.components.core.navic")
local usr_noice_component = require("usr.modules.feline.components.core.noice")

local M = {}

M.default_left_sep = ""
M.default_right_sep = ""

M.components = {
    active = {
        {
            require("usr.modules.feline.components.core.mode"),

            usr_noice_component.command,

            usr_noice_component.mode,

            {
                provider = usr_navic_component.provider,
                enabled = usr_navic_component.enabled,
            },

            usr_git_component.branch,

            usr_git_component.diff_added,

            usr_git_component.diff_changed,

            usr_git_component.diff_removed,
        },

        {
            usr_lsp_component.client_names,

            usr_lsp_component.diagnostic_errors,

            usr_lsp_component.diagnostic_warnings,

            usr_lsp_component.diagnostic_info,

            usr_lsp_component.diagnostic_hints,
        },

        {
            {
                provider = require("usr.modules.feline.components.core.file_info").provider,
                hl = {
                    bg = "orange",
                    fg = "bg",
                    style = "bold"
                },
                left_sep = {
                    str = M.default_left_sep,
                },
                right_sep = {
                    str = M.default_right_sep,
                },
            },
        }
    },
    inactive = {}
}

return M
