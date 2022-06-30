local vi_mode_provider = require("feline.providers.vi_mode")
local usr_feline_util = require("usr.modules.feline.util")

local separator_hl = function()
    return {
        bg = usr_feline_util.theme.bg,
        fg = vi_mode_provider.get_mode_color(),
    }
end

local inverse_separator_hl = function()
    return {
        bg = vi_mode_provider.get_mode_color(),
    }
end

return {
    provider = {
        name = "vi_mode",
        opts = {
            show_mode_name = true,
        },
    },
    hl = function()
        return {
            name = vi_mode_provider.get_mode_highlight_name(),
            bg = vi_mode_provider.get_mode_color(),
            fg = "black",
            style = "bold"
        }
    end,
    left_sep = function()
        return {
            str = " ",
            hl = inverse_separator_hl(),
        }
    end,
    right_sep = function()
        return {
            str = usr_feline_util.default_right_separator,
            hl = separator_hl(),
        }
    end,
}
