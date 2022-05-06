vim.api.nvim_create_user_command("Gt", "Git --paginate t <args>", {})
vim.keymap.set("n", "<leader>gs", ":Git<cr>")
vim.keymap.set("n", "<leader>gd", ":Git<cr>")
vim.keymap.set("n", "<leader>gt", ":Gt<cr>")
