local usr_feline_util = require("usr.modules.feline.util")

vim.bo.fileformat:upper()

local accent_color = "orange"
local text_color = "black"

local text_hl = {
    bg = accent_color,
    fg = text_color,
    style = "bold"
}

local separator_hl = {
    bg = usr_feline_util.theme.bg,
    fg = accent_color,
    style = "bold"
}

return {
    hl = text_hl,
    left_sep = {
        hl = separator_hl,
        str = usr_feline_util.default_left_separator,
    },
    provider = function()
        local encoding = vim.bo.fileencoding:upper()
        local format = vim.bo.fileformat:upper()

        return " " .. format .. " / " .. encoding
    end,
    right_sep = {
        hl = separator_hl,
        str = usr_feline_util.default_right_separator,
    },
}
