local feline_theme = require("usr.feline.themes.gruvbox-flat")
local colors = require("usr.themes.gruvbox-flat").colors
local usr_dir_path_component =
    require("usr.feline.components.core.dir_path")
local usr_feline_util = require("usr.feline.util")
local usr_file_info_component =
    require("usr.feline.components.core.file_info")
local usr_git_component = require("usr.feline.components.core.git")
local usr_lsp_component = require("usr.feline.components.core.lsp")
local usr_mode_component = require("usr.feline.components.core.mode")
local usr_noice_component = require("usr.feline.components.core.noice")
local usr_spacer_component =
    require("usr.feline.components.core.spacer")

local M = {}

M.components = {
    active = {
        {
            join_tables_forced(usr_mode_component, feline_theme.default_seps),

            usr_spacer_component,

            join_tables_forced(
                usr_git_component.branch,
                feline_theme.default_seps,
                {

                    hl = {
                        bg = "yellow",
                        fg = feline_theme.default_fg,
                        style = feline_theme.default_style,
                    },
                }
            ),

            join_tables_forced(usr_git_component.diff_added, {
                hl = {
                    fg = colors.git.add,
                    style = "bold",
                },
            }),

            join_tables_forced(usr_git_component.diff_changed, {
                hl = {
                    fg = colors.git.change,
                    style = "bold",
                },
            }),

            join_tables_forced(usr_git_component.diff_removed, {
                hl = {
                    fg = colors.git.delete,
                    style = "bold",
                },
            }),

            {
                provider = feline_theme.default_right_sep.str,
                enabled = usr_git_component.branch.enabled,
                hl = {
                    bg = "yellow",
                    fg = "bg",
                },
            },

            {
                provider = feline_theme.default_right_sep.str,
                enabled = usr_git_component.branch.enabled,
                hl = {
                    fg = "yellow",
                },
            },

            usr_spacer_component,
        },

        {
            join_tables_forced(
                usr_lsp_component.client_names,
                feline_theme.default_seps,
                {
                    hl = {
                        bg = "purple",
                        fg = "bg",
                        style = "bold",
                    },
                }
            ),

            join_tables_forced(usr_lsp_component.diagnostic_errors, {
                hl = {
                    fg = "error",
                    style = "bold",
                },
            }),

            join_tables_forced(usr_lsp_component.diagnostic_warnings, {
                hl = {
                    fg = "warning",
                    style = "bold",
                },
            }),

            join_tables_forced(usr_lsp_component.diagnostic_info, {
                hl = {
                    fg = "info",
                    style = "bold",
                },
            }),

            join_tables_forced(usr_lsp_component.diagnostic_hints, {
                hl = {
                    fg = "hint",
                    style = "bold",
                },
            }),

            {
                provider = feline_theme.default_right_sep.str,
                enabled = usr_lsp_component.client_names.enabled,
                hl = {
                    bg = "purple",
                    fg = "bg",
                },
            },

            {
                provider = feline_theme.default_right_sep.str,
                enabled = usr_lsp_component.client_names.enabled,
                hl = {
                    fg = "purple",
                },
            },

            join_tables_forced(usr_spacer_component, {
                enabled = usr_lsp_component.client_names.enabled,
            }),

            usr_noice_component.mode,

            join_tables_forced(usr_spacer_component, {
                enabled = usr_noice_component.mode.enabled,
            }),

            join_tables_forced(
                usr_noice_component.search,
                feline_theme.default_seps,
                {
                    hl = {
                        bg = "red",
                        fg = "bg",
                        style = "bold",
                    },
                }
            ),

            join_tables_forced(usr_spacer_component, {
                enabled = usr_noice_component.search.enabled,
            }),

            join_tables_forced(
                usr_dir_path_component,
                feline_theme.default_seps,
                {
                    hl = {
                        bg = "aqua",
                        fg = "bg",
                        style = "bold",
                    },
                }
            ),

            usr_spacer_component,

            join_tables_forced(
                usr_file_info_component,
                feline_theme.default_seps,
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
