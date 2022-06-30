local cursor_provider = require("feline.providers.cursor")
local usr_feline_util = require("usr.modules.feline.util")

local accent_color = "yellow"
local text_color = "black"

local separator_hl = {
    bg = usr_feline_util.theme.bg,
    fg = accent_color,
}

return {
    hl = {
        bg = accent_color,
        fg = text_color,
        style = "bold"
    },
    left_sep = {
        str = usr_feline_util.default_left_separator,
        hl = separator_hl,
    },
    provider = function()
        return " " .. cursor_provider.position({}, {})
    end,
    right_sep = {
        str = usr_feline_util.default_right_separator,
        hl = separator_hl,
    },
}