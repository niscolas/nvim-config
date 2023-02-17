local opts = { silent = true }

keymap("n", "<leader>qq", ":Bdelete<cr>", opts)
keymap("n", "<leader>qf", ":Bdelete!<cr>", opts)
-- close all buffers
keymap("n", "<leader>qa", ":bufdo Bdelete<cr>", opts)
