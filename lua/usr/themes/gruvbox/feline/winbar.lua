local feline_theme = require("usr.themes.gruvbox.feline")
local usr_window_number_component =
    require("usr.feline.components.core.windor_number")
local usr_file_path_component =
    require("usr.feline.components.core.file_path")
local usr_navic_component = require("usr.feline.components.core.navic")
local usr_spacer_component =
    require("usr.feline.components.core.spacer")

local M = {}

M.components = {
    active = {
        {
            join_tables_forced(
                usr_window_number_component,
                feline_theme.default_seps,
                {
                    hl = {
                        bg = "yellow",
                        fg = "bg",
                        style = "bold",
                    },
                }
            ),

            usr_spacer_component,

            join_tables_forced(
                usr_file_path_component.simple,
                feline_theme.default_seps
            ),

            {
                provider = niscolas.icons.right_arrow,
                enabled = usr_navic_component.enabled,
                hl = {
                    style = "bold",
                },
            },

            join_tables_forced(usr_spacer_component, {
                enabled = usr_navic_component.enabled,
            }),

            join_tables_forced(usr_navic_component, { hl = { bg = "red" } }),

            usr_spacer_component,
        },
        {},
        {},
    },
    inactive = {
        {
            join_tables_forced(
                usr_window_number_component,
                feline_theme.default_seps,
                {
                    hl = {
                        bg = "blue",
                        fg = "bg",
                        style = "bold",
                    },
                }
            ),

            usr_spacer_component,

            join_tables_forced(
                usr_file_path_component.simple,
                feline_theme.default_seps
            ),

            {
                provider = niscolas.icons.right_arrow,
                enabled = usr_navic_component.enabled,
                hl = {
                    style = "bold",
                },
            },

            join_tables_forced(usr_spacer_component, {
                enabled = usr_navic_component.enabled,
            }),

            join_tables_forced(usr_navic_component, { hl = { bg = "red" } }),

            usr_spacer_component,
        },
        {},
        {},
    },
}

return M
