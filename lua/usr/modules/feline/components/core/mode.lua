local vi_mode_provider = require("feline.providers.vi_mode")
local usr_feline_util = require("usr.modules.feline.util")

return {
    provider = function ()
        local mode = vi_mode_provider.get_vim_mode()
        local result = " " .. string.sub(mode, 1, 1)
        return result
    end,
    hl = function()
        return {
            name = vi_mode_provider.get_mode_highlight_name(),
            bg = vi_mode_provider.get_mode_color(),
            fg = "bg",
            style = "bold"
        }
    end,
    left_sep = function()
        return {
            str = usr_feline_util.default_left_separator,
        }
    end,
    right_sep = function()
        return {
            str = usr_feline_util.default_right_separator,
        }
    end,
}
