local M = {}

M.setup = function ()
    local colors = require("gruvbox-baby.colors").config()

    vim.cmd.highlight("clear", "SpellBad")
    vim.cmd.highlight("SpellBad", "cterm = undercurl", "gui = undercurl")
end

return M
