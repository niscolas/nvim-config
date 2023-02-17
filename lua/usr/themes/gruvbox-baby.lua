local M = {}

M.before_plugin = function()
    vim.g.gruvbox_baby_telescope_theme = 0
    vim.g.gruvbox_baby_transparent_mode = 0
end

M.after_plugin = function()
    local colors = require("gruvbox-baby.colors").config()

    vim.cmd.highlight("clear", "SpellBad")
    vim.cmd.highlight("SpellBad", "cterm = undercurl", "gui = undercurl")
end

return M
