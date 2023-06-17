local cursor_provider = require("feline.providers.cursor")
local usr_feline_util = require("usr.feline.util")

local accent_color = "yellow"
local text_color = "black"

local separator_hl = {
    fg = accent_color,
}

local inverse_separator_hl = {
    bg = accent_color,
}

return {
    hl = {
        bg = accent_color,
        fg = text_color,
        style = "bold",
    },
    left_sep = {
        str = usr_feline_util.default_left_separator,
        hl = separator_hl,
    },
    provider = function()
        return " " .. cursor_provider.position({}, {})
    end,
    right_sep = {
        str = " ",
        hl = inverse_separator_hl,
    },
}
