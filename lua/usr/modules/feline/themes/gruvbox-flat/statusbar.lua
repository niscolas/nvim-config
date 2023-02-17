local self_theme = require("usr.modules.feline.themes.gruvbox-flat")
local usr_feline_util = require("usr.modules.feline.util")
local usr_file_info_component =
    require("usr.modules.feline.components.core.file_info")
local usr_git_component = require("usr.modules.feline.components.core.git")
local usr_lsp_component = require("usr.modules.feline.components.core.lsp")
local usr_navic_component = require("usr.modules.feline.components.core.navic")
local usr_noice_component = require("usr.modules.feline.components.core.noice")

local M = {}

M.components = {
    active = {
        {
            require("usr.modules.feline.components.core.mode"),

            join_tables_forced(
                usr_git_component.branch,
                self_theme.default_separators,
                {
                    hl = {
                        bg = "yellow",
                        fg = "bg",
                        style = "bold",
                    },
                }
            ),

            usr_git_component.diff_added,

            usr_git_component.diff_changed,

            usr_git_component.diff_removed,

            join_tables_forced(
                usr_navic_component,
                {
                    hl = {
                        bg = "none",
                        fg = "none",
                    },
                }
                -- self_theme.space_separators
            ),
        },

        {
            join_tables_forced(
                usr_lsp_component.client_names,
                self_theme.default_separators,
                {
                    hl = {
                        bg = "purple",
                        fg = "bg",
                        style = "bold",
                    },
                }
            ),

            usr_lsp_component.diagnostic_errors,

            usr_lsp_component.diagnostic_warnings,

            usr_lsp_component.diagnostic_info,

            usr_lsp_component.diagnostic_hints,

            usr_noice_component.mode,

            join_tables_forced(
                usr_noice_component.search,
                self_theme.default_separators,
                {
                    hl = {
                        bg = "red",
                        fg = "bg",
                        style = "bold",
                    },
                    icon = " ",
                }
            ),

            join_tables_forced(
                usr_file_info_component,
                self_theme.default_separators,
                {
                    hl = {
                        bg = "orange",
                        fg = "bg",
                        style = "bold",
                    },
                }
            ),
        },
    },
    inactive = {},
}

return M
