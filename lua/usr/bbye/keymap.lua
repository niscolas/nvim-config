local opts = { silent = true }

new_keymap("n", "<leader>qq", ":Bdelete<cr>", opts)
new_keymap("n", "<leader>qf", ":Bdelete!<cr>", opts)
-- close all buffers
new_keymap("n", "<leader>qa", ":bufdo Bdelete<cr>", opts)
