local M = {}

M.before_plugin = function ()
    vim.g.gruvbox_italic_functions = true
    vim.g.gruvbox_transparent = true
    vim.g.gruvbox_flat_style = "dark"
end

M.after_plugin = function ()
end

return M
