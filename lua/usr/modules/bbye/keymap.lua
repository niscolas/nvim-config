local opts = { silent = true }

vim.keymap.set("n", "<leader>qq", ":Bdelete<cr>", opts)
vim.keymap.set("n", "<leader>qf", ":Bdelete!<cr>", opts)
-- close all buffers
vim.keymap.set("n", "<leader>qa", ":bufdo Bdelete<cr>", opts)
