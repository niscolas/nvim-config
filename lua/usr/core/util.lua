local M = {}

M.create_autocmd = vim.api.nvim_create_autocmd
M.create_keybinding = vim.keymap.set
M.set = vim.opt
M.set_local = vim.opt_local

return M
