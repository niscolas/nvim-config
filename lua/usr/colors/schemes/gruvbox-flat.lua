local M = {}

M.colors = {}

M.before_plugin = function()
    vim.g.gruvbox_italic_functions = true
    vim.g.gruvbox_transparent = true
    vim.g.gruvbox_flat_style = "hard"

    local gruvbox_colors_ok, gruvbox_colors = pcall(require, "gruvbox.colors")
    if gruvbox_colors_ok then
        M.colors = gruvbox_colors.setup()
    end
end

M.after_plugin = function() end

return M
