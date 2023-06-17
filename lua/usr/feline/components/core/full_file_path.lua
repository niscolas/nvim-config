local M = {}

local usr_feline_util = require("usr.feline.util")

local active_accent_color = "skyblue"
local active_text_color = "black"

local inactive_accent_color = "white"
local inactive_text_color = "black"

local default_bg = usr_feline_util.theme.bg

local active_separator_hl = {
    bg = default_bg,
    fg = active_accent_color,
}

local inactive_separator_hl = {
    bg = default_bg,
    fg = inactive_accent_color,
}

M.get = function(is_active)
    local accent_color = is_active and active_accent_color
        or inactive_accent_color

    local text_color = is_active and active_text_color or inactive_text_color

    local separator_hl = is_active and active_separator_hl
        or inactive_separator_hl

    return {
        hl = {
            fg = text_color,
            bg = accent_color,
            style = "bold",
        },
        left_sep = function()
            return {
                str = usr_feline_util.default_left_separator,
                hl = separator_hl,
            }
        end,
        provider = {
            name = "file_info",
            opts = {
                colored_icon = false,
                type = "relative",
            },
        },
        right_sep = function()
            return {
                str = usr_feline_util.default_right_separator,
                hl = separator_hl,
            }
        end,
    }
end

return M
