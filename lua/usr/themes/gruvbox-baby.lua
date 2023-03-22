local M = {}

M.before_plugin = function()
    g.gruvbox_baby_telescope_theme = 0
    g.gruvbox_baby_transparent_mode = 0
end

M.after_plugin = function()
    local colors = require("gruvbox-baby.colors").config()

    cmd.highlight("clear", "SpellBad")
    cmd.highlight("SpellBad", "cterm = undercurl", "gui = undercurl")
end

return M
