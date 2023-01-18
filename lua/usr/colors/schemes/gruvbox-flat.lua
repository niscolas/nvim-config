local M = {}

M.colors = {}

M.before_plugin = function()
    vim.g.gruvbox_italic_functions = true
    vim.g.gruvbox_transparent = true
    vim.g.gruvbox_flat_style = "hard"

    M.colors = require("gruvbox.colors").setup {}
end

M.after_plugin = function()
end

return M
