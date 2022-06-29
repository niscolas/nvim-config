local opts = { silent = true }
vim.keymap.set("n", "<leader>ee", ":NvimTreeToggle<cr>", opts)
vim.keymap.set("n", "<leader>ef", ":NvimTreeFindFile<cr>", opts)
vim.keymap.set("n", "<leader>er", ":NvimTreeRefresh<cr>", opts)
