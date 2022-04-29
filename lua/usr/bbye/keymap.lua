local opts = { silent = true }

vim.keymap.set("n", "<leader>qq", ":Bdelete<cr>", opts)
vim.keymap.set("n", "<leader>qf", ":Bdelete!<cr>", opts)
vim.keymap.set("n", "<leader>qa", ":Bwipeout<cr>", opts)
